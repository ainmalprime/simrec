class IntakeDocumentsController < ApplicationController
  before_filter :record_referrer
  def record_referrer
    session[:return_to] = request.url
  end

  # GET /intake_documents
  # GET /intake_documents.json
  def index
    @intake_documents = IntakeDocument.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @intake_documents }
    end
  end

  # GET /intake_documents/1
  # GET /intake_documents/1.json
  def show
    @intake_document = IntakeDocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @intake_document }
    end
  end

  # GET /intake_documents/new
  # GET /intake_documents/new.json
  def new
    @intake_document = IntakeDocument.new
    @intake_document.visit_id = params[:visit_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @intake_document }
    end
  end

  # GET /intake_documents/1/edit
  def edit
    @intake_document = IntakeDocument.find(params[:id])
  end

  # POST /intake_documents
  # POST /intake_documents.json
  def create
    @intake_document = IntakeDocument.new(params[:intake_document])

    respond_to do |format|
      if @intake_document.save
        format.html { redirect_to @intake_document, notice: 'Intake document was successfully created.' }
        format.json { render json: @intake_document, status: :created, location: @intake_document }
      else
        format.html { render action: "new" }
        format.json { render json: @intake_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /intake_documents/1
  # PUT /intake_documents/1.json
  def update
    @intake_document = IntakeDocument.find(params[:id])

    respond_to do |format|
      if @intake_document.update_attributes(params[:intake_document])
        format.html { redirect_to @intake_document, notice: 'Intake document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intake_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intake_documents/1
  # DELETE /intake_documents/1.json
  def destroy
    @intake_document = IntakeDocument.find(params[:id])
    @intake_document.destroy

    respond_to do |format|
      format.html { redirect_to intake_documents_url }
      format.json { head :no_content }
    end
  end
end
