class UsersController < ApplicationController
  include SessionsHelper
  before_filter :check_site_configuration
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
end
