class StaticPagesController < ApplicationController
   include SessionsHelper
   before_filter :clear_patient
   before_filter :check_site_configuration
   before_filter :record_referrer

  def record_referrer
    session[:return_to] = request.url
  end
  
  def home

  end

  def search
  
  end

end
