class LabReportTemplatesController < ApplicationController
  # GET /lab_report_templates
  # GET /lab_report_templates.json
  def index
    @lab_report_templates = LabReportTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lab_report_templates }
    end
  end

  # GET /lab_report_templates/1
  # GET /lab_report_templates/1.json
  def show
    @lab_report_template = LabReportTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lab_report_template }
    end
  end

  # GET /lab_report_templates/new
  # GET /lab_report_templates/new.json
  def new
    @lab_report_template = LabReportTemplate.new
    3.times do
      @lab_report_field = @lab_report_template.lab_report_fields.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lab_report_template }
    end
  end

  # GET /lab_report_templates/1/edit
  def edit
    @lab_report_template = LabReportTemplate.find(params[:id])
  end

  # POST /lab_report_templates
  # POST /lab_report_templates.json
  def create
    @lab_report_template = LabReportTemplate.new(params[:lab_report_template])

    respond_to do |format|
      if @lab_report_template.save
        format.html { redirect_to @lab_report_template, notice: 'Lab report template was successfully created.' }
        format.json { render json: @lab_report_template, status: :created, location: @lab_report_template }
      else
        format.html { render action: "new" }
        format.json { render json: @lab_report_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lab_report_templates/1
  # PUT /lab_report_templates/1.json
  def update
    @lab_report_template = LabReportTemplate.find(params[:id])

    respond_to do |format|
      if @lab_report_template.update_attributes(params[:lab_report_template])
        format.html { redirect_to @lab_report_template, notice: 'Lab report template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lab_report_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_report_templates/1
  # DELETE /lab_report_templates/1.json
  def destroy
    @lab_report_template = LabReportTemplate.find(params[:id])
    @lab_report_template.destroy

    respond_to do |format|
      format.html { redirect_to lab_report_templates_url }
      format.json { head :no_content }
    end
  end
end
