class RecentActivitiesController < ApplicationController
  # GET /recent_activities
  # GET /recent_activities.json
  def index
    @recent_activities = RecentActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recent_activities }
    end
  end

  # GET /recent_activities/1
  # GET /recent_activities/1.json
  def show
    @recent_activity = RecentActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recent_activity }
    end
  end

  # GET /recent_activities/new
  # GET /recent_activities/new.json
  def new
    @recent_activity = RecentActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recent_activity }
    end
  end

  # GET /recent_activities/1/edit
  def edit
    @recent_activity = RecentActivity.find(params[:id])
  end

  # POST /recent_activities
  # POST /recent_activities.json
  def create
    @recent_activity = RecentActivity.new(params[:recent_activity])

    respond_to do |format|
      if @recent_activity.save
        format.html { redirect_to @recent_activity, notice: 'Recent activity was successfully created.' }
        format.json { render json: @recent_activity, status: :created, location: @recent_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @recent_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recent_activities/1
  # PUT /recent_activities/1.json
  def update
    @recent_activity = RecentActivity.find(params[:id])

    respond_to do |format|
      if @recent_activity.update_attributes(params[:recent_activity])
        format.html { redirect_to @recent_activity, notice: 'Recent activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recent_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recent_activities/1
  # DELETE /recent_activities/1.json
  def destroy
    @recent_activity = RecentActivity.find(params[:id])
    @recent_activity.destroy

    respond_to do |format|
      format.html { redirect_to recent_activities_url }
      format.json { head :no_content }
    end
  end
end
