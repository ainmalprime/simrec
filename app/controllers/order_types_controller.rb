class OrderTypesController < ApplicationController
   include SessionsHelper #load up the SessionsHelper functions to help manage the user session
  before_filter :check_site_configuration #make sure a location configuration has been selected.
  before_filter :record_referrer #record referrer in a session varable for the purposes of navigating back to start point after an action is performed.
  def record_referrer
    session[:return_to] = request.url
  end
 
  # GET /order_types
  # GET /order_types.json
  def index
    @order_types = OrderType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_types }
    end
  end

  # GET /order_types/1
  # GET /order_types/1.json
  def show
    @order_type = OrderType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_type }
    end
  end

  # GET /order_types/new
  # GET /order_types/new.json
  def new
    @order_type = OrderType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_type }
    end
  end

  # GET /order_types/1/edit
  def edit
    @order_type = OrderType.find(params[:id])
  end

  # POST /order_types
  # POST /order_types.json
  def create
    @order_type = OrderType.new(params[:order_type])

    respond_to do |format|
      if @order_type.save
        format.html { redirect_to @order_type, notice: 'Order type was successfully created.' }
        format.json { render json: @order_type, status: :created, location: @order_type }
      else
        format.html { render action: "new" }
        format.json { render json: @order_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_types/1
  # PUT /order_types/1.json
  def update
    @order_type = OrderType.find(params[:id])

    respond_to do |format|
      if @order_type.update_attributes(params[:order_type])
        format.html { redirect_to @order_type, notice: 'Order type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_types/1
  # DELETE /order_types/1.json
  def destroy
    @order_type = OrderType.find(params[:id])
    @order_type.destroy

    respond_to do |format|
      format.html { redirect_to order_types_url }
      format.json { head :no_content }
    end
  end
end
