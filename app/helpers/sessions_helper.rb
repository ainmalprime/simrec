module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def clear_patient
    session[:current_patient_id] = nil
    @patient = nil
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

  def force_login_with_message_and_redirect (message, path)
    session[:return_to] = path
    redirect_to "/signin", notice: message

  end

  def log_action (object)
    log_content = " "
    object.attributes.each do |key, value|
      if key != "sim_session" && key != "created_at" && key != "updated_at" && !key.include?("_id") && !key.nil? && !value.nil?  && !value.blank?
        log_content += "<h3>" + key.humanize + "</h3>" + "<p>" + value.to_s + "</p>"
      end
    end
    ActionLogEntry.create({description: "<h2>" + object.class.name.titleize + "</h2>", content: log_content, sim_session: request.session_options[:id]})
  end

  def add_recent_activity (description, resource, resource_id, visit_id, sim_session, visible=true, time_recorded=Time.now) 
    @recent_activity = RecentActivity.new
    @recent_activity.description = description 
    @recent_activity.resource = resource
    @recent_activity.resource_id = resource_id
    @recent_activity.visit_id = visit_id
    @recent_activity.time_recorded = time_recorded
    @recent_activity.visible = visible
    if session[:simulation_mode]
      @recent_activity.sim_session = sim_session 
    end
    @recent_activity.save
  end

end
