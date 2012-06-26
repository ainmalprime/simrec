class UsersController < ApplicationController
  include SessionsHelper #load up the SessionsHelper functions to help manage the user session
  before_filter :check_site_configuration #make sure a location configuration has been selected.
  before_filter :clear_patient #clear out the selected patient because the user has browsed away from the patient detail page

  def show

    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def index

    @users = User.all
  end

  def edit

    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
