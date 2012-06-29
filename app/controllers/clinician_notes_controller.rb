class ClinicianNotesController < ApplicationController
   include SessionsHelper
   before_filter :check_site_configuration
   layout "popover", only: [:ajax_new]

  # GET /clinician_notes
  # GET /clinician_notes.json
  def index
    @clinician_notes = ClinicianNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clinician_notes }
    end
  end

  # GET /clinician_notes/1
  # GET /clinician_notes/1.json
  def show
    @clinician_note = ClinicianNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @clinician_note }
    end
  end

  # GET /clinician_notes/new
  # GET /clinician_notes/new.json
  def new
    
    @clinician_note = ClinicianNote.new
    @clinician_note.visit_id = params[:visit_id]


    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render :json => @clinician_note }
    end
  end

  def ajax_new
    
    new
  end

  # GET /clinician_notes/1/edit
  def edit
    @clinician_note = ClinicianNote.find(params[:id])
  end

  # POST /clinician_notes
  # POST /clinician_notes.json
  def create
    @clinician_note = ClinicianNote.new(params[:clinician_note])
    
    #if simulation mode is active, add the session id to the note so that 
    #it is only available to the current sim session and will be deleted 
    #when the sim session is reset -tg
    if session[:simulation_mode] 
      @clinician_note.time_recorded = Time.now()
      @clinician_note.sim_session = request.session_options[:id]
      log_action @clinician_note
    end

   
    

    respond_to do |format|
      if @clinician_note.save
         #show the clinician note in the recent activities section
        add_recent_activity @clinician_note.note_type + ' note added by ' + @clinician_note.clinician_signature, 'clinician_note', @clinician_note.id, @clinician_note.visit_id, request.session_options[:id]
        format.html { redirect_to session[:return_to], :notice => 'Clinician note was successfully created.' }
        format.json { render :json => @clinician_note, :status => :created, :location => @clinician_note }
      else
        format.html { render :action => "new" }
        format.json { render :json => @clinician_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clinician_notes/1
  # PUT /clinician_notes/1.json
  def update
    @clinician_note = ClinicianNote.find(params[:id])

    respond_to do |format|
      if @clinician_note.update_attributes(params[:clinician_note])
        format.html { redirect_to session[:return_to], :notice => 'Clinician note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @clinician_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clinician_notes/1
  # DELETE /clinician_notes/1.json
  def destroy
    @clinician_note = ClinicianNote.find(params[:id])
    @clinician_note.destroy
    RecentActivity.destroy_all resource_id: params[:id], resource: "clinician_note"

    respond_to do |format|
      format.html { redirect_to session[:return_to] }
      format.json { head :no_content }
    end
  end
end
