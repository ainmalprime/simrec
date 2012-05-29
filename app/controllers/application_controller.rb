class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_session
  #include sessionsHelper

  def prepare_session
  	if session[:simulation_mode].nil?
  		session[:simulation_mode] = true
	end
  end

  def simulation_mode
  	session[:simulation_mode] = true

  	respond_to do |format|
      format.html {redirect_to root_url, :notice => 'simulation mode activated'}
      #format.json { render :json => 'simulation_mode' }
    end
  end
 
  def edit_mode
  	session[:simulation_mode] = false

  	respond_to do |format|
      format.html {redirect_to root_url, :notice => 'edit mode activated'}
      #format.json { render :json => 'simulation_mode' }
    end
  end

  def end_session
  	reset_session
  end
end
