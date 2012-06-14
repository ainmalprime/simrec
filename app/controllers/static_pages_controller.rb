class StaticPagesController < ApplicationController
   before_filter :record_referrer
  def record_referrer
    session[:return_to] = request.url
  end
  
  def home
  	session[:current_patient_id] = false
    @patient = nil
    if !cookies[:site_configuration_id]
      redirect_to site_configurations_path
    end
  end

  def search
  	session[:current_patient_id] = false
    @patient = nil
  end

end
