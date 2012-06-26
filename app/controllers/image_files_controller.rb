class ImageFilesController < ApplicationController
  include SessionsHelper #load up the SessionsHelper functions to help manage the user session
  before_filter :check_site_configuration, except: [:code_image] #make sure a location configuration has been selected. Exclude displaying an image from the databse because it is necessary to be able to display images in the location configuration page before a configuration is selected.
  before_filter :record_referrer, except: [:code_image, :edit] #record referrer in a session varable for the purposes of navigating back to start point after an action is performed.
  def record_referrer
    session[:return_to] = request.url
  end
  
  def code_image 
    @image_data = ImageFile.find(params[:id]) 
    send_data @image_data.binary_data, :type => @image_data.content_type, :disposition => 'inline'
  end

  # GET /image_files
  # GET /image_files.json
  def index
    @image_files = ImageFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @image_files }
    end
  end

  # GET /image_files/1
  # GET /image_files/1.json
  def show
    @image_file = ImageFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image_file }
    end
  end

  # GET /image_files/new
  # GET /image_files/new.json
  def new
    @image_file = ImageFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image_file }
    end
  end

  # GET /image_files/1/edit
  def edit
    @image_file = ImageFile.find(params[:id])
  end

  # POST /image_files
  # POST /image_files.json
  def create
    @image_file = ImageFile.new(params[:image_file])
    
    saved = @image_file.save

    if params.has_key?(:patient_id) #if there is an associated patient_id, update the patient in question with the new image_file_id -TG
      @patient = Patient.find(params[:patient_id]) 
      @patient.image_file_id = @image_file.id
      @patient.save
      redirect_location = edit_patient_path(@patient)
    elsif params.has_key?(:intake_document_id)
      @intake_document = IntakeDocument.find(params[:intake_document_id]) 
      @intake_document.image_file_id = @image_file.id
      @intake_document.save
      redirect_location = edit_intake_document_path(@intake_document)
    elsif params.has_key?(:lab_and_diagnostic_report_id)
      @lab_and_diagnostic_report = LabAndDiagnosticReport.find(params[:lab_and_diagnostic_report_id]) 
      @lab_and_diagnostic_report.image_file_id = @image_file.id
      @lab_and_diagnostic_report.save
      redirect_location = edit_lab_and_diagnostic_report_path(@lab_and_diagnostic_report)
    elsif params.has_key?(:site_configuration_id)
      @site_configuration_id = SiteConfiguration.find(params[:site_configuration_id]) 
      @site_configuration_id.image_file_id = @image_file.id
      @site_configuration_id.save
      redirect_location = edit_site_configuration_path(@site_configuration_id)
    else
      redirect_location = @image_file
    end

    respond_to do |format|
      if saved 
        format.html { redirect_to redirect_location , notice: 'Image file was successfully created.' }
        if redirect_location == @image_file
          format.json { render json: @image_file, status: :created, location: @image_file }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end

  
  end

  # PUT /image_files/1
  # PUT /image_files/1.json
  def update
    @image_file = ImageFile.find(params[:id])

    respond_to do |format|
      if @image_file.update_attributes(params[:image_file])
        format.html { redirect_to @image_file, notice: 'Image file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_files/1
  # DELETE /image_files/1.json
  def destroy
    @image_file = ImageFile.find(params[:id])
    @image_file.destroy
    if params.has_key?(:patient_id) #if there is an associated patient_id, make sure the image_file_id is revmoved from the patient's attributes -TG
      @patient = Patient.find(params[:patient_id])
      @patient.image_file_id = nil
      @patient.save
      redirect_location = @patient
    elsif params.has_key?(:intake_document_id)
      @intake_document = IntakeDocument.find(params[:intake_document_id])
      @intake_document.image_file_id = nil
      @intake_document.save
      redirect_location = @intake_document
    elsif params.has_key?(:lab_and_diagnostic_report_id)
      @lab_and_diagnostic_report = LabAndDiagnosticReport.find(params[:lab_and_diagnostic_report_id])
      @lab_and_diagnostic_report.image_file_id = nil
      @lab_and_diagnostic_report.save
      redirect_location = @lab_and_diagnostic_report
    else
      redirect_location = image_files_url
    end


    respond_to do |format|
      format.html { redirect_to redirect_location }
      format.json { head :no_content }
    end

  end
end
