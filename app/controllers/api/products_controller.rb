class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index 
    @products = Product.all
    
    search_terms = params[:search]
    if search_terms
      @products = @products.where(" name ILIKE ?", "%#{search_terms}%")
    end
    @products = @products.order(:id => :asc)
    @products = @products.order(:price => :asc)

    render "index.json.jbuilder"
  end
  

  def show
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end 

  def create
    @product = Product.new(name: params["name"], price: params["price"], description: params["description"])
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end

  def update 
    @product = Product.find_by(id: params[:id])
    @product.name = params["name"] ||  @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end

  def delete 
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "It has been eleminated."}
  end

  def authenticate_admin 
    unless current_user && current_user.admin 
      render json: {}, status: :unauthorized
    end 
  end 
end
