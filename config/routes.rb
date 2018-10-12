Rails.application.routes.draw do
  get "/all_products" => "api/products#all_products"
  
end
