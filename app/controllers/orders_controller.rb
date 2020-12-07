class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
  end

  private
 
  def order_params
    
  end
end
