module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
    !current_user.nil?
  end  

  def administrator?
    signed_in? && current_user.privileges == 'administrator'
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    session[:simulation_mode] = true
  end

  def check_site_configuration
    if !cookies[:site_configuration_id] 
      if signed_in?
        redirect_to site_configurations_path
      else
        force_login_with_message_and_redirect 'The EHR simulator needs to be configured for this sim center. Please log in to continue.', site_configurations_path
      end
    end
  end 

  def force_login_with_message_and_redirect(message, return_to = '/')
    session[:return_to] = return_to if !return_to.empty?
    return redirect_to '/signin', :notice =>  message 
  end

  def edit_mode
    return force_login_with_message_and_redirect('Please log in to permanently edit simulation medical records.', '/edit') if !signed_in?
    session[:simulation_mode] = false

    respond_to do |format|
      format.html {redirect_to session[:return_to], :notice => 'edit mode activated'}
    end
  end

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

end
