class PatientsController < ApplicationController
  before_filter :record_referrer, except: [:lab_reports]
  before_filter :create_resetable_simulation, except: [:index]


  def record_referrer
    session[:return_to] = request.url
  end
  

  def get_emr_objects_from_database
    @patient = Patient.find(params[:id])
    session[:current_patient_id] = @patient.id
    
    @visits = @patient.visits
    if params.has_key?(:selectedVisit) 

      @selectedVisit = @patient.visits.find(params[:selectedVisit])
    else
      @selectedVisit = @patient.visits.first
    end
    
    unless @selectedVisit.nil?
      @clinician_notes = get_sim_or_edit_version( "clinician_notes")
      @clinician_orders = @selectedVisit.clinician_orders.paginate(page: params[:clinician_orders_page], per_page:4)
      @flow_sheet_records = @selectedVisit.flow_sheet_records.paginate(page: params[:flow_sheet_records_page], per_page:4)
      @medical_administration_records = @selectedVisit.medical_administration_records.paginate(page: params[:medical_administration_records_page], per_page:4)
      @intake_documents = @selectedVisit.intake_documents.paginate(page: params[:intake_documents_page], per_page:4)
      @lab_and_diagnostic_reports = @selectedVisit.lab_and_diagnostic_reports.paginate(page: params[:lab_and_diagnostic_reports_page], per_page:4)
    end
  end

  def create_resetable_simulation
    get_emr_objects_from_database
    if session[:simulation_mode] && !session[:emr_objects_in_simulation] 
          @clinician_notes.each do |clinician_note|
          @clinician_note_copy = clinician_note.dup
          @clinician_note_copy.sim_session = request.session_options[:id]
          @clinician_note_copy.save
          session[:emr_objects_in_simulation] = true
      end
    end
  end

  def get_sim_or_edit_version(collection)
    if !session[:simulation_mode] or !session[:emr_objects_in_simulation]
      object = @selectedVisit.send(collection).find(:all, conditions: ["sim_session IS NULL"])
    else
      object = @selectedVisit.send(collection).find(:all, conditions: ["sim_session = ?", request.session_options[:id]])
    end
  end


  # GET /patients
  # GET /patients.json
  def index
    session[:current_patient_id] = false
    @patient = nil
    
    if params.has_key?(:search)
      @patients = Patient.find :all, :conditions => ["lower(last_name) like ?", "%" + params[:search].downcase + "%"]
    else
      @patients = Patient.all
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @patients }
    end
  end

  def lab_reports
    @selectedVisit = Visit.find(params[:id])
    @lab_and_diagnostic_reports = @selectedVisit.lab_and_diagnostic_reports
    render :partial => "lab_and_diagnostic_reports"
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
