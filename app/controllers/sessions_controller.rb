class SessionsController < ApplicationController
  def index
    @sessions = Session.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  def destroy
    @session = Session.find(params[:id])
    session_id = @session.session_id
    @session.destroy
    ClinicianNote.destroy_all(sim_session: session_id)
    ClinicianOrder.destroy_all(sim_session: session_id)
    FlowSheetRecord.destroy_all(sim_session: session_id)
    LabAndDiagnosticReport.destroy_all(sim_session: session_id)
    MedicalAdministrationRecord.destroy_all(sim_session: session_id)
    RecentActivities.destroy_all(sim_session: session_id)

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to session[:return_to]
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def signout
    sign_out
    redirect_to root_path
  end

  def edit_mode
    return force_login_with_message_and_redirect('Please log in to permanently edit simulation medical records.') if !signed_in?
    session[:simulation_mode] = false

    respond_to do |format|
      format.html {redirect_to session[:return_to], :notice => 'edit mode activated'}
    end
  end

  def review
    @action_log_entries = ActionLogEntry.find :all, conditions: ["sim_session = ?",  (request.session_options[:id])]
  end
  
  def simulation_mode
    reset_sim
  end
 

  def end_session
    reset_session
  end

  def reset_sim
    back_to = session[:return_to]
    ClinicianNote.destroy_all(sim_session: request.session_options[:id])
    ClinicianOrder.destroy_all(sim_session: request.session_options[:id])
    FlowSheetRecord.destroy_all(sim_session: request.session_options[:id])
    MedicalAdministrationRecord.destroy_all(sim_session: request.session_options[:id])
    LabAndDiagnosticReport.destroy_all(sim_session: request.session_options[:id])
    RecentActivity.destroy_all(sim_session: request.session_options[:id])
    
    @visits_to_change = Visit.find :all, conditions: ["duration_til_now_hours > 0"] 
    
    @visits_to_change.each do |visit|
      visit.visit_time = visit.duration_til_now_hours.hours.ago
      visit.save  
      update_times_on_child_records(visit, 'clinician_notes')
      update_times_on_child_records(visit, 'clinician_orders')
      update_times_on_child_records(visit, 'flow_sheet_records')
      update_times_on_child_records(visit, 'medical_administration_records')
      update_times_on_child_records(visit, 'lab_and_diagnostic_reports')
    end

    reset_session
    session[:return_to] = root_url
    respond_to do |format|
      format.html {redirect_to back_to, :notice => 'simulation session reset'} rescue redirect_to root_url
    end
  end



  private
    def update_times_on_child_records(object, collection)
      object.send(collection).each do |item|
        if !item.minutes_after_start_of_visit.nil?
          if collection == 'lab_and_diagnostic_reports'
            item.time_released = object.visit_time + item.minutes_after_start_of_visit.minutes
          else
            item.time_recorded = object.visit_time + item.minutes_after_start_of_visit.minutes
          end
        end
        item.save
      end 
    end
end
