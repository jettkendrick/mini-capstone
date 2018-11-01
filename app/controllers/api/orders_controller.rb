class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index 
    @orders = current_user.orders
    render "index.json.jbuilder" 
  end

  def create
    @carted_product = CartedProduct.where(user_id: user, status: "carted")
    subtotal = 0
    tax = 0 
    total = 0 
    @carted_product.each do |user|
      subtotal = subtotal + user.product.price * user.quantity
      tax = tax + user.product.tax * user.quantity
      total = total + user.product.total * user.quantity
      user.status = "purchased"
      user.save
    end

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order.save
    if @order.save
      render json: {message: "successfully ordered"}
    end
  end
end 