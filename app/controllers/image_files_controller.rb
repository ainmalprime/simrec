class ImageFilesController < ApplicationController

  def code_image 
  @image_data = ImageFile.find(params[:id]) 
  send_data @image_data.binary_data, :type => @image_data.content_type, :disposition => 'inline'
  end

  # GET /image_files
  # GET /image_files.json
  def index
    @image_files = ImageFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @image_files }
    end
  end

  # GET /image_files/1
  # GET /image_files/1.json
  def show
    @image_file = ImageFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image_file }
    end
  end

  # GET /image_files/new
  # GET /image_files/new.json
  def new
    @image_file = ImageFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image_file }
    end
  end

  # GET /image_files/1/edit
  def edit
    @image_file = ImageFile.find(params[:id])
  end

  # POST /image_files
  # POST /image_files.json
  def create
    @image_file = ImageFile.new(params[:image_file])
    
    if params.has_key?(:patient_id) #if there is an associated patient_id, update the patient in question with the new image_file_id -TG
      @patient = Patient.find(params[:patient_id]) 

      respond_to do |format|
        if @image_file.save
          @patient.image_file_id = @image_file.id
          @patient.save
          format.html { redirect_to edit_patient_path(@patient) , notice: 'Image file was successfully created.' } #redirect to the patient editing view
          
          #format.json { render json: @image_file, status: :created, location: @image_file }
        else
          format.html { render action: "new" }
          format.json { render json: @image_file.errors, status: :unprocessable_entity }
        end
      end 
    else
      respond_to do |format|
        if @image_file.save
          format.html { redirect_to @image_file , notice: 'Image file was successfully created.' }
          format.json { render json: @image_file, status: :created, location: @image_file }
        else
          format.html { render action: "new" }
          format.json { render json: @image_file.errors, status: :unprocessable_entity }
        end
      end
    end
  
  end

  # PUT /image_files/1
  # PUT /image_files/1.json
  def update
    @image_file = ImageFile.find(params[:id])

    respond_to do |format|
      if @image_file.update_attributes(params[:image_file])
        format.html { redirect_to @image_file, notice: 'Image file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_files/1
  # DELETE /image_files/1.json
  def destroy
    @image_file = ImageFile.find(params[:id])
    @image_file.destroy
    if params.has_key?(:patient_id) #if there is an associated patient_id, make sure the image_file_id is revmoved from the patient's attributes -TG
      @patient = Patient.find(params[:patient_id])
      @patient.image_file_id = nil
      @patient.save

      respond_to do |format|
        format.html { redirect_to edit_patient_path(@patient) } #go back to the patient view page -TG
        format.json { head :no_content }
      end
    else #if there are no identifying parameters, do the default redirect -TG
      respond_to do |format|
        format.html { redirect_to image_files_url }
        format.json { head :no_content }
      end
    end
  end
end
