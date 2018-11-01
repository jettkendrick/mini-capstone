json.array! @carted_product.each do |carted|
  json.id carted.id
  json.product_id carted.product_id
  json.quantity carted.quantity
  json.status carted.status 
end 