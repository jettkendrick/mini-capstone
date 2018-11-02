class ProductsController < ApplicationController
  def index 
    @products = Product.all
    @products = @products.order(:id => :asc)
    render "index.html.erb"
  end 

  def new 
    render "new.html.erb"
  end 

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end 

  def create 
    @product = Product.new(
      name: params[:name],
      price: params[:price].to_i,
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    @product.save
    redirect_to "/products"
  end 

  def edit
    @product = Product.find_by(id: params[:id]) 
    render "edit.html.erb"
  end 

  def update 
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.description = params[:description]
    @product.supplier_id = params[:supplier_id] 
    @product.save
    redirect_to "/products"
  end 

  def delete 
    @product = Product.find_by(id: params[:id])
    @product.destroy 
    redirect_to "/products"
  end 
end
