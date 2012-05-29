class ClinicianNotesController < ApplicationController
  #before_filter :make_sim_copy 
  layout "popover", :only => [:ajax_new]
  #def make_sim_copy
  #  if session[:simulation_mode]
      
  #end

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
    @Visit = Visit.find(@clinician_note.visit_id) #reconstruct patient and visit to redirect back to patient  -tg
    @Patient = Patient.find(@Visit.patient_id)

    respond_to do |format|
      if @clinician_note.save
        format.html { redirect_to @Patient, :notice => 'Clinician note was successfully created.' }
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
        format.html { redirect_to @clinician_note, :notice => 'Clinician note was successfully updated.' }
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

    respond_to do |format|
      format.html { redirect_to clinician_notes_url }
      format.json { head :no_content }
    end
  end
end
