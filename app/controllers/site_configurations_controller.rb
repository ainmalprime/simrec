class SiteConfigurationsController < ApplicationController
  include SessionsHelper #load up the SessionsHelper functions to help manage the user session
  before_filter :clear_patient  #clear out the selected patient because the user has browsed away from the patient detail page

  # GET /site_configurations
  # GET /site_configurations.json
  def index
    clear_patient
    @site_configurations = SiteConfiguration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_configurations }
    end
  end

  # GET /site_configurations/1
  # GET /site_configurations/1.json
  def show
    @site_configuration = SiteConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_configuration }
    end
  end

  # GET /site_configurations/new
  # GET /site_configurations/new.json
  def new

    #set up some devault settings the user can edit
    @site_configuration = SiteConfiguration.new(location_name: "DeVry", logo_text: "Simulation EHR", logo_text_color: "FFFFFF", top_bar_gradient_start_color: "111111", top_bar_gradient_end_color: "444444", secondary_bar_gradient_start_color: "999999", secondary_bar_gradient_end_color: "CCCCCC", secondary_header_text_color: "282842", page_background_color: "FFFFFF", patient_info_box_background_color: "FFFFFF")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_configuration }
    end
  end

  # GET /site_configurations/1/edit
  def edit
    @site_configuration = SiteConfiguration.find(params[:id])
  end

  def set_config
    @site_configuration = SiteConfiguration.find(params[:id])
    cookies.delete :site_configuration_id #this step might not be necessary
    cookies.permanent[:site_configuration_id] = params[:id] #save the site configuration ID in a permanent cookie so it won't be necessary to reconfigure the site the next time the browser goes to it
    redirect_to site_configurations_path
  end

  # POST /site_configurations
  # POST /site_configurations.json
  def create
    @site_configuration = SiteConfiguration.new(params[:site_configuration])

    respond_to do |format|
      if @site_configuration.save
        format.html { redirect_to @site_configuration, notice: 'Site configuration was successfully created.' }
        format.json { render json: @site_configuration, status: :created, location: @site_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @site_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_configurations/1
  # PUT /site_configurations/1.json
  def update
    @site_configuration = SiteConfiguration.find(params[:id])

    respond_to do |format|
      if @site_configuration.update_attributes(params[:site_configuration])
        format.html { redirect_to @site_configuration, notice: 'Site configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_configurations/1
  # DELETE /site_configurations/1.json
  def destroy
    @site_configuration = SiteConfiguration.find(params[:id])
    @site_configuration.destroy
    if @site_configuration == cookies[:site_configuration_id]
      cookies.delete :site_configuration_id
    end

    respond_to do |format|
      format.html { redirect_to site_configurations_url }
      format.json { head :no_content }
    end
  end
end
