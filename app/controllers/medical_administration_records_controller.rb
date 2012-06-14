class MedicalAdministrationRecordsController < ApplicationController
  include SessionsHelper
  before_filter :check_site_configuration
  layout "popover", :only => [:ajax_new]


  # GET /medical_administration_records
  # GET /medical_administration_records.json
  def index
    @medical_administration_records = MedicalAdministrationRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @medical_administration_records }
    end
  end

  # GET /medical_administration_records/1
  # GET /medical_administration_records/1.json
  def show
    @medical_administration_record = MedicalAdministrationRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @medical_administration_record }
    end
  end

  # GET /medical_administration_records/new
  # GET /medical_administration_records/new.json
  def new
    @medical_administration_record = MedicalAdministrationRecord.new
    @medical_administration_record.visit_id = params[:visit_id]

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render :json => @medical_administration_record }
    end
  end

  def ajax_new
    new
  end

  # GET /medical_administration_records/1/edit
  def edit
    @medical_administration_record = MedicalAdministrationRecord.find(params[:id])
  end

  # POST /medical_administration_records
  # POST /medical_administration_records.json
  def create
    @medical_administration_record = MedicalAdministrationRecord.new(params[:medical_administration_record])
    @Visit = Visit.find(@medical_administration_record.visit_id) #reconstruct patient and visit to redirect back to patient  -tg
    @Patient = Patient.find(@Visit.patient_id)
    
    respond_to do |format|
      if @medical_administration_record.save
        format.html { redirect_to @Patient, :notice => 'Medical administration record was successfully created.' }
        format.json { render :json => @medical_administration_record, :status => :created, :location => @medical_administration_record }
      else
        format.html { render :action => "new" }
        format.json { render :json => @medical_administration_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medical_administration_records/1
  # PUT /medical_administration_records/1.json
  def update
    @medical_administration_record = MedicalAdministrationRecord.find(params[:id])
    @Visit = Visit.find(@medical_administration_record.visit_id) #reconstruct patient and visit to redirect back to patient  -tg
    @Patient = Patient.find(@Visit.patient_id)

    respond_to do |format|
      if @medical_administration_record.update_attributes(params[:medical_administration_record])
        format.html { redirect_to @Patient, :notice => 'Medical administration record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @medical_administration_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_administration_records/1
  # DELETE /medical_administration_records/1.json
  def destroy
    @medical_administration_record = MedicalAdministrationRecord.find(params[:id])
    @medical_administration_record.destroy

    respond_to do |format|
      format.html { redirect_to session[:return_to] }
      format.json { head :no_content }
    end
  end
end
