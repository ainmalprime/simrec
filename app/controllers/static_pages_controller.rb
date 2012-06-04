class StaticPagesController < ApplicationController
   before_filter :record_referrer
  def record_referrer
    session[:return_to] = request.url
  end
  
  def home
  	session[:current_patient_id] = false
    @patient = nil
  end

  def search
  	session[:current_patient_id] = false
    @patient = nil
  end

end
