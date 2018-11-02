Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#delete"
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    post "/orders" => "orders#create"
    get "/orders" => "orders#index"
    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"
  end

  get "/products" => "products#index"
  get "products/new" => "products#new" 
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
end


# get "/choose_product" => "products#choose_product"