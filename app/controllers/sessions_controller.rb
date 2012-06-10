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

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end
end
