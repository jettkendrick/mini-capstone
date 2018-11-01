class Api::CartedProductsController < ApplicationController
  def index 
    user = current_user.id
    @carted_product = CartedProduct.where(user_id: user, status: "carted")
    render "index.json.jbuilder"
  end 

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id, 
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted")
    if @carted_product.save
      render json: {message: 'product added successfully'}
    end 

  end 
end
