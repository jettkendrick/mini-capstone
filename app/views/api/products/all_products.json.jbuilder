json.array! @products.each do |products|
  json.name products.name 
  json.price products.price
  json.image products.image_url
  json.description products.description
end