class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :prepare_session




  def prepare_session
    if cookies[:site_configuration_id]
        @site_configuration = SiteConfiguration.find(cookies[:site_configuration_id].to_i) 
    end

    if @site_configuration.nil?
      @site_configuration = SiteConfiguration.new(location_name: "Simulation EHR", logo_text: "Simulation EHR", logo_text_color: "FFFFFF", top_bar_gradient_start_color: "111111", top_bar_gradient_end_color: "444444", secondary_bar_gradient_start_color: "999999", secondary_bar_gradient_end_color: "CCCCCC", secondary_header_text_color: "282842", page_background_color: "FFFFFF", patient_info_box_background_color: "FFFFFF")
    end

  	session[:simulation_mode] = true if session[:simulation_mode].nil?
	  

    if session[:current_patient_id]
      @patient = Patient.find(session[:current_patient_id])
    else
      @patient = nil
    end

  end

end
