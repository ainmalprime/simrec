class ClinicianOrdersController < ApplicationController   
  include SessionsHelper
  before_filter :check_site_configuration
  layout "popover", :only => [:ajax_new]


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
      if session[:simulation_mode] 
        @clinician_order.sim_session = request.session_options[:id]
        @action_log_entry = ActionLogEntry.create({description: "order entered", content: "<h3>type:</h3> #{@clinician_order.order_type} <h3> note: </h3> #{@clinician_order.note} <h3> signature: </h3> #{@clinician_order.clincian_signature}", sim_session: request.session_options[:id]}) 
      end   
      success = @clinician_order.save
    end
    #if simulation mode is active, add the session id to the note so that 
    #it is only available to the current sim session and will be deleted 
    #when the sim session is reset -tg


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
      format.html { redirect_to session[:return_to] }
      format.json { head :no_content }
    end
  end
end
