class LabAndDiagnosticReportsController < ApplicationController
  # GET /lab_and_diagnostic_reports
  # GET /lab_and_diagnostic_reports.json
  def index
    @lab_and_diagnostic_reports = LabAndDiagnosticReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lab_and_diagnostic_reports }
    end
  end

  # GET /lab_and_diagnostic_reports/1
  # GET /lab_and_diagnostic_reports/1.json
  def show
    @lab_and_diagnostic_report = LabAndDiagnosticReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lab_and_diagnostic_report }
    end
  end

  # GET /lab_and_diagnostic_reports/new
  # GET /lab_and_diagnostic_reports/new.json
  def new
    @lab_and_diagnostic_report = LabAndDiagnosticReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lab_and_diagnostic_report }
    end
  end

  # GET /lab_and_diagnostic_reports/1/edit
  def edit
    @lab_and_diagnostic_report = LabAndDiagnosticReport.find(params[:id])
  end

  # POST /lab_and_diagnostic_reports
  # POST /lab_and_diagnostic_reports.json
  def create
    @lab_and_diagnostic_report = LabAndDiagnosticReport.new(params[:lab_and_diagnostic_report])

    respond_to do |format|
      if @lab_and_diagnostic_report.save
        format.html { redirect_to @lab_and_diagnostic_report, notice: 'Lab and diagnostic report was successfully created.' }
        format.json { render json: @lab_and_diagnostic_report, status: :created, location: @lab_and_diagnostic_report }
      else
        format.html { render action: "new" }
        format.json { render json: @lab_and_diagnostic_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lab_and_diagnostic_reports/1
  # PUT /lab_and_diagnostic_reports/1.json
  def update
    @lab_and_diagnostic_report = LabAndDiagnosticReport.find(params[:id])

    respond_to do |format|
      if @lab_and_diagnostic_report.update_attributes(params[:lab_and_diagnostic_report])
        format.html { redirect_to @lab_and_diagnostic_report, notice: 'Lab and diagnostic report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lab_and_diagnostic_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_and_diagnostic_reports/1
  # DELETE /lab_and_diagnostic_reports/1.json
  def destroy
    @lab_and_diagnostic_report = LabAndDiagnosticReport.find(params[:id])
    @lab_and_diagnostic_report.destroy

    respond_to do |format|
      format.html { redirect_to lab_and_diagnostic_reports_url }
      format.json { head :no_content }
    end
  end
end
