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
    # session[:emr_objects_in_simulation] = false
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
