class LabAndDiagnosticReportsController < ApplicationController
  include SessionsHelper #load up the SessionsHelper functions to help manage the user session
  before_filter :check_site_configuration #make sure a location configuration has been selected.
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
    @lab_and_diagnostic_report.visit_id = params[:visit_id]
    @order_types = OrderType.all
    @order_type_categories = @order_types.group_by(&:category)

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
    #@lab_and_diagnostic_report = LabAndDiagnosticReport.new(params[:lab_and_diagnostic_report])
    #@lab_and_diagnostic_report.result_text = "test report"
    params[:order_types].each do |order_type|
      @lab_and_diagnostic_report = LabAndDiagnosticReport.new(params[:lab_and_diagnostic_report])
      @lab_and_diagnostic_report.order_type = order_type
      @lab_and_diagnostic_report.save
      #show the lab report in the recent activities section
      add_recent_activity 'report: ' + @lab_and_diagnostic_report.order_type, 'lab_and_diagnostic_report', @lab_and_diagnostic_report.id, @lab_and_diagnostic_report.visit_id, request.session_options[:id], @lab_and_diagnostic_report.visible
    end

    respond_to do |format|
      if @lab_and_diagnostic_report.save
        format.html { redirect_to @lab_and_diagnostic_report, notice: 'Lab and diagnostic report was successfully created.' }
        format.js
        #format.json { render json: @lab_and_diagnostic_report, status: :created, location: @lab_and_diagnostic_report }
      else
        format.html { render action: "new" }
        format.js
        #format.json { render json: @lab_and_diagnostic_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lab_and_diagnostic_reports/1
  # PUT /lab_and_diagnostic_reports/1.json
  def update
    @lab_and_diagnostic_report = LabAndDiagnosticReport.find(params[:id])


    respond_to do |format|
      if @lab_and_diagnostic_report.update_attributes(params[:lab_and_diagnostic_report])
        @recent_activity = RecentActivity.where(resource_id: params[:id], resource: 'lab_and_diagnostic_report').first
        @recent_activity.visible = @lab_and_diagnostic_report.visible
        @recent_activity.save
        format.html { redirect_to session[:return_to], notice: 'Lab and diagnostic report was successfully updated.' }
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
    RecentActivity.destroy_all resource_id: params[:id], resource: "lab_and_diagnostic_report"

    respond_to do |format|
      format.html { redirect_to session[:return_to] }
      format.json { head :no_content }
    end
  end
end
