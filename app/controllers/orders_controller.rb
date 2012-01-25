class OrdersController < ApplicationController
  include Spree::Core::ControllerHelpers

  # START: Lots of spree code

  # defines the default response
  respond_to :html
  
  def update
    @order = current_order
    if @order.update_attributes(params[:order])
      @order.line_items = @order.line_items.select {|li| li.quantity > 0 }
      respond_with(@order) { |format| format.html { redirect_to cart_path } }
    else
      respond_with(@order)
    end
  end
  
  # Adds a new item to the order (creating a new order if none already exists)
  #
  # Parameters can be passed using the following possible parameter configurations:
  #
  # * Single variant/quantity pairing
  # +:variants => {variant_id => quantity}+
  #
  # * Multiple products at once
  # +:products => {product_id => variant_id, product_id => variant_id}, :quantity => quantity +
  # +:products => {product_id => variant_id, product_id => variant_id}}, :quantity => {variant_id => quantity, variant_id => quantity}+
  def populate
    @order = current_order(true)

    logger.warn "@order: #{@order.inspect}"
    # logger.debug "params: #{params[:variations]}"

    variations = []
    params[:variations].each do |id, selection|
      variations << Variation.find(id).name + ":"
      variations << selection
    end

    quantity    = params[:quantity].to_i
    description = variations.join('\n')

    @order.add_item(Plate.find(params[:plate]),description,quantity) if quantity > 0
    respond_with(@order) do |format| 
      format.html { redirect_to cart_path }
    end    
  end

  def empty
    if @order = current_order
      @order.line_items.destroy_all
    end

    redirect_to cart_path
  end
  

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = current_order

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  # def update
  #   @order = Order.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @order.update_attributes(params[:order])
  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { head :ok }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
end
