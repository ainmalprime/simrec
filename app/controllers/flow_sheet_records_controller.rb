class FlowSheetRecordsController < ApplicationController
  #controls the functionality of the Vitals and Ins and Outs section of patient detail. The class is called "FlowSheet" because this is a shorter name some healthcare professionals use for that type of patient record.
  include SessionsHelper #load up the SessionsHelper functions to help manage the user session
  before_filter :check_site_configuration #make sure a location configuration has been selected.
  layout "popover", :only => [:ajax_new] #use the ajax_new layout template that is designed for being displayed within a popover div when learners are entering a new flow sheet record


  # GET /flow_sheet_records
  # GET /flow_sheet_records.json
  def index
    @flow_sheet_records = FlowSheetRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flow_sheet_records }
    end
  end

  # GET /flow_sheet_records/1
  # GET /flow_sheet_records/1.json
  def show
    @flow_sheet_record = FlowSheetRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flow_sheet_record }
    end
  end

  # GET /flow_sheet_records/new
  # GET /flow_sheet_records/new.json
  def new

    @flow_sheet_record = FlowSheetRecord.new
    @flow_sheet_record.visit_id = params[:visit_id]

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @flow_sheet_record }
    end
  end

  def ajax_new
    new
  end

  # GET /flow_sheet_records/1/edit
  def edit
    @flow_sheet_record = FlowSheetRecord.find(params[:id])
  end

  # POST /flow_sheet_records
  # POST /flow_sheet_records.json
  def create
    @flow_sheet_record = FlowSheetRecord.new(params[:flow_sheet_record])
    @Visit = Visit.find(@flow_sheet_record.visit_id) #reconstruct patient and visit to redirect back to patient view
    @Patient = Patient.find(@Visit.patient_id)

    if session[:simulation_mode] 
      @flow_sheet_record.time_recorded = Time.now()
      @flow_sheet_record.sim_session = request.session_options[:id]
      log_action @flow_sheet_record
    end
    

    respond_to do |format|
      if @flow_sheet_record.save
        format.html { redirect_to @Patient, notice: 'Flow sheet record was successfully created.' }
        format.json { render json: @flow_sheet_record, status: :created, location: @flow_sheet_record }
      else
        format.html { render action: "new" }
        format.json { render json: @flow_sheet_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flow_sheet_records/1
  # PUT /flow_sheet_records/1.json
  def update
    @flow_sheet_record = FlowSheetRecord.find(params[:id])

    respond_to do |format|
      if @flow_sheet_record.update_attributes(params[:flow_sheet_record])
        format.html { redirect_to session[:return_to], notice: 'Flow sheet record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flow_sheet_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flow_sheet_records/1
  # DELETE /flow_sheet_records/1.json
  def destroy
    @flow_sheet_record = FlowSheetRecord.find(params[:id])
    @flow_sheet_record.destroy

    respond_to do |format|
      format.html { redirect_to session[:return_to] }
      format.json { head :no_content }
    end
  end
end
