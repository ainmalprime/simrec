class FlowSheetRecordsController < ApplicationController
  include SessionsHelper
  before_filter :check_site_configuration
  layout "popover", :only => [:ajax_new]
  before_filter :record_referrer
  def record_referrer
    session[:return_to] = request.url
  end

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
        format.html { redirect_to @flow_sheet_record, notice: 'Flow sheet record was successfully updated.' }
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
      format.html { redirect_to flow_sheet_records_url }
      format.json { head :no_content }
    end
  end
end
