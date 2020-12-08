class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to orders_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_title, :prefecture_id, :order_city, :order_address, :order_delivery_date_first, :order_delivery_date_end, :division, :unit_price, :budget, :payment_id, :order_pr, industry_type: []).merge(user_id: current_user.id)
  end

end
