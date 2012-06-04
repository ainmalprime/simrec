class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_session



  def prepare_session
  	if session[:simulation_mode].nil?
  		session[:simulation_mode] = true
	  end
    if session[:current_patient_id]
      @patient = Patient.find(session[:current_patient_id])
    else
      @patient = nil
    end

  end

  def simulation_mode
  	session[:simulation_mode] = true

  	respond_to do |format|
      format.html {redirect_to session[:return_to], :notice => 'simulation mode activated'}
      #format.json { render :json => 'simulation_mode' }
    end
  end
 
  def edit_mode
  	session[:simulation_mode] = false

  	respond_to do |format|
      format.html {redirect_to session[:return_to], :notice => 'edit mode activated'}
      #format.json { render :json => 'simulation_mode' }
    end
  end

  def end_session
  	reset_session
  end
end
