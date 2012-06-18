class Array
  def add_condition! (condition, conjunction = 'AND')
    if String === condition
      add_condition!([condition])
    elsif Hash === condition
      add_condition!([condition.keys.map { |attr| "#{attr}=?" }.join(' AND ')] + condition.values)
    elsif Array === condition
      self[0] = "(#{self[0]}) #{conjunction} (#{condition.shift})" unless empty?
      (self << condition).flatten!
    else
      raise "don't know how to handle this condition type"
    end
    self
  end
end


class PatientsController < ApplicationController
  include SessionsHelper
  before_filter :check_site_configuration
  before_filter :record_referrer, except: [:lab_reports]
  before_filter :create_resetable_simulation, except: [:index]


  def record_referrer
    session[:return_to] = request.url
  end
  

  def get_emr_objects_from_database
    if params.has_key?(:id)
      @patient = Patient.find(params[:id])
    else
      @patient = Patient.new
    end
    session[:current_patient_id] = @patient.id
    
    @visits = @patient.visits
    if params.has_key?(:selectedVisit) 

      @selectedVisit = @patient.visits.find(params[:selectedVisit])
    else
      @selectedVisit = @patient.visits.first
    end
    
    unless @selectedVisit.nil?
      @clinician_notes = get_sim_or_edit_version("clinician_notes", false)
      @clinician_orders = get_sim_or_edit_version("clinician_orders", false)
      @flow_sheet_records = get_sim_or_edit_version("flow_sheet_records", false)
      @medical_administration_records = get_sim_or_edit_version("medical_administration_records", false)
      find_releasable_reports
      @lab_and_diagnostic_reports = get_sim_or_edit_version("lab_and_diagnostic_reports", true)

      @intake_documents = @selectedVisit.intake_documents.paginate(page: params[:intake_documents_page], per_page:4)
    end
  end

  def create_resetable_simulation
    get_emr_objects_from_database
    if session[:simulation_mode] && !session[:emr_objects_in_simulation] && !@selectedVisit.nil?
      copy_objects [@clinician_notes, @clinician_orders, @flow_sheet_records, @lab_and_diagnostic_reports, @medical_administration_records]
      session[:emr_objects_in_simulation] = true
    end
  end

  def copy_objects(objects)
    unless objects.nil?
      objects.each do |collection|
        collection.each do |item|
            item_copy = item.dup
            item_copy.sim_session = request.session_options[:id]
            item_copy.save
        end
      end
    end
  end

  def get_sim_or_edit_version(collection, checkvisibility)
    if !session[:simulation_mode] or !session[:emr_objects_in_simulation]
      object = @selectedVisit.send(collection).find(:all, conditions: ["sim_session IS NULL"])
    else
      if checkvisibility
        object = @selectedVisit.send(collection).find(:all, conditions: ["sim_session = ? and visible = 1", request.session_options[:id]])
      else
        object = @selectedVisit.send(collection).find(:all, conditions: ["sim_session = ?", request.session_options[:id]])
      end
    end
  end



  # GET /patients
  # GET /patients.json
  def index
    session[:current_patient_id] = false
    @patient = nil
    
    conditions = []
    conditions.add_condition!(['lower(last_name) like ?', '%' + params[:last_name].downcase + '%']) unless params[:last_name].blank?
    conditions.add_condition!(['lower(first_name) like ?', '%' + params[:first_name].downcase + '%']) unless params[:first_name].blank?
    conditions.add_condition!(['lower(middle_initial) like ?', '%' + params[:middle_initial].downcase + '%']) unless params[:middle_initial].blank?
    conditions.add_condition!(['lower(date_of_birth) = ?',  params[:date_of_birth]]) unless params[:date_of_birth].blank?
    conditions.add_condition!(['lower(patient_number) like ?', '%' + params[:patient_number].downcase + '%']) unless params[:patient_number].blank?

    if conditions.size > 0

      @patients = Patient.find :all, :conditions => conditions

    else
      @patients = Patient.all
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @patients }
    end
  end

  def lab_reports
    #called by the lab reports pane when it automatically refreshes to see if any reports
    #are available -tg
    @selectedVisit = Visit.find(params[:id])
    find_releasable_reports
    @lab_and_diagnostic_reports = get_sim_or_edit_version("lab_and_diagnostic_reports", true)
    render :partial => "lab_and_diagnostic_reports"
  end

  def find_releasable_reports
    @clinician_orders = @selectedVisit.clinician_orders.find(:all, conditions: ["sim_session = ?", request.session_options[:id]])
   
   @clinician_orders.each do |clinician_order|
      #if a clinician order's order_type matches the lab report's order_type, 
      #check to see if the proper amount of time has elapsed since the order
      #was placed -tg
      @lab_and_diagnostic_reports = get_sim_or_edit_version("lab_and_diagnostic_reports", false)
      if @lab_and_diagnostic_reports 
        @lab_and_diagnostic_reports.each do |lab_report|
          if (clinician_order.time_recorded < lab_report.release_delay.to_i.minutes.ago)
            lab_report.visible = true
            lab_report.time_released = Time.now
            lab_report.save
          end
        end
      end
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    get_emr_objects_from_database

    respond_to do |format|

      format.html # show.html.erb
      #format.js
      format.json { render :json => @patient }
    end
  end



  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, :notice => 'Patient was successfully created.' }
        format.json { render :json => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.json { render :json => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|

      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, :notice => 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

end
