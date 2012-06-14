class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_session

  def review
    @action_log_entries = ActionLogEntry.find :all, conditions: ["sim_session = ?",  (request.session_options[:id])]
  end

  def reset_sim
    back_to = session[:return_to]
    ClinicianNote.destroy_all(sim_session: request.session_options[:id])
    ClinicianOrder.destroy_all(sim_session: request.session_options[:id])
    FlowSheetRecord.destroy_all(sim_session: request.session_options[:id])
    MedicalAdministrationRecord.destroy_all(sim_session: request.session_options[:id])
    LabAndDiagnosticReport.destroy_all(sim_session: request.session_options[:id])
    reset_session
    session[:return_to] = root_url
    respond_to do |format|
      format.html {redirect_to back_to, :notice => 'simulation session reset'}
    end
  end


  def prepare_session
    if cookies[:site_configuration_id]
        @site_configuration = SiteConfiguration.find(cookies[:site_configuration_id].to_i) 
    end

    if @site_configuration.nil?
      @site_configuration = SiteConfiguration.new(location_name: Rails.configuration.location_name, logo_text: Rails.configuration.logo_text, logo_text_color: Rails.configuration.logo_text_color, top_bar_gradient_start_color: Rails.configuration.top_bar_gradient_start_color, top_bar_gradient_end_color: Rails.configuration.top_bar_gradient_end_color, secondary_bar_gradient_start_color: Rails.configuration.secondary_bar_gradient_start_color, secondary_bar_gradient_end_color: Rails.configuration.secondary_bar_gradient_end_color, secondary_header_text_color: Rails.configuration.secondary_header_text_color, page_background_color: Rails.configuration.page_background_color, patient_info_box_background_color: Rails.configuration.patient_info_box_background_color)
    end

  	session[:simulation_mode] = true if session[:simulation_mode].nil?
	  

    if session[:current_patient_id]
      @patient = Patient.find(session[:current_patient_id])
    else
      @patient = nil
    end

  end

  def simulation_mode
    reset_sim
  end
 
  def edit_mode
  	session[:simulation_mode] = false

  	respond_to do |format|
      format.html {redirect_to session[:return_to], :notice => 'edit mode activated'}
    end
  end

  def end_session
  	reset_session
  end
end
