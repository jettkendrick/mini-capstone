json.array! @products.each do |products| 
  json.id products.id
  json.name products.name 
  json.price products.price
  json.description products.description
  json.tax products.tax
  json.total products.total
  json.discounted products.is_discounted?
  json.supplier products.supplier
  json.images products.image_url_list
  json.categories products.categories
end


