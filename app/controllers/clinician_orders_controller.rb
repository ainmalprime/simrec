class ClinicianOrdersController < ApplicationController
  layout "popover", :only => [:ajax_new]
  before_filter :record_referrer
  def record_referrer
    session[:return_to] = request.url
  end

  # GET /clinician_orders
  # GET /clinician_orders.json
  def index
    @clinician_orders = ClinicianOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clinician_orders }
    end
  end

  # GET /clinician_orders/1
  # GET /clinician_orders/1.json
  def show
    @clinician_order = ClinicianOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
 
      format.json { render json: @clinician_order }
    end
  end



  # GET /clinician_orders/new
  # GET /clinician_orders/new.json
  def new
    @clinician_order = ClinicianOrder.new
    @clinician_order.visit_id = params[:visit_id]
    @order_types = OrderType.all
    @order_type_categories = @order_types.group_by(&:category)

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @clinician_order }
    end
  end

  def ajax_new
    new
  end

  # GET /clinician_orders/1/edit
  def edit
    @clinician_order = ClinicianOrder.find(params[:id])
  end

  # POST /clinician_orders
  # POST /clinician_orders.json
  def create

    params[:order_types].each do |order_type|
      @clinician_order = ClinicianOrder.new(params[:clinician_order])
      @clinician_order.order_type = order_type
      success = @clinician_order.save
    end
    
    @Visit = Visit.find(@clinician_order.visit_id) #reconstruct patient and visit to redirect back to patient  -tg
    @Patient = Patient.find(@Visit.patient_id)


    respond_to do |format|
      if 
        format.html { redirect_to @Patient, notice: 'Clinician order was successfully created.' }
        format.json { render json: @clinician_order, status: :created, location: @clinician_order }
      else
        format.html { render action: "new" }
        format.json { render json: @clinician_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clinician_orders/1
  # PUT /clinician_orders/1.json
  def update
    @clinician_order = ClinicianOrder.find(params[:id])
    @Visit = Visit.find(@clinician_order.visit_id) #reconstruct patient and visit to redirect back to patient  -tg
    @Patient = Patient.find(@Visit.patient_id)

    respond_to do |format|
      if @clinician_order.update_attributes(params[:clinician_order])
        format.html { redirect_to @Patient, notice: 'Clinician order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clinician_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinician_orders/1
  # DELETE /clinician_orders/1.json
  def destroy
    @clinician_order = ClinicianOrder.find(params[:id])
    @clinician_order.destroy

    respond_to do |format|
      format.html { redirect_to clinician_orders_url }
      format.json { head :no_content }
    end
  end
end
