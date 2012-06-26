#The application controller is called at beginning of a user session

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper #include sessions controller to gain access to the customized session control functions
  before_filter :prepare_session #make sure the browser session variables are set up




  def prepare_session
    #look for session variables that track site configuration settings and that determine which mode the site is in.

    if cookies[:site_configuration_id]
        @site_configuration = SiteConfiguration.find(cookies[:site_configuration_id].to_i) rescue nil
    end

    #if no site configuration has been set, create a temporary configuration for use until the user creates or vselects a preexsiting one 
    if @site_configuration.nil?
      @site_configuration = SiteConfiguration.new(location_name: "DeVry", logo_text: "Simulation EHR", logo_text_color: "FFFFFF", top_bar_gradient_start_color: "111111", top_bar_gradient_end_color: "444444", secondary_bar_gradient_start_color: "999999", secondary_bar_gradient_end_color: "CCCCCC", secondary_header_text_color: "282842", page_background_color: "FFFFFF", patient_info_box_background_color: "FFFFFF")
    end

    #if no simulation mode has been selected, default to "simulation mode"
  	session[:simulation_mode] = true if session[:simulation_mode].nil?
	  
    #if a patient is already being viewed, get the patient's info from the database
    if session[:current_patient_id]
      @patient = Patient.find(session[:current_patient_id]) rescue nil
    else
      @patient = nil
    end

  end

end
