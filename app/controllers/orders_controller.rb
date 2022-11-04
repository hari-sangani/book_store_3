class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders or /orders.json
  def index
    @orders = current_user.orders.all
  end

  # GET /orders/1 or /orders/1.json
  def show; end

  # GET /orders/new
  def new
    @order = current_user.orders.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders or /orders.json
  def create
    @order = current_user.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to root_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.permit(:user_id, :date, :status, :active)
  end

  def orders_books_params
    params.permit(:book_id, :quantity, :mrp, :discount, :price)
  end
end
