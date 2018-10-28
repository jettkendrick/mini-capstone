  json.id @product.id
  json.name @product.name 
  json.price @product.price
  json.description @product.description
  json.tax @product.tax
  json.total @product.total
  json.discounted @product.is_discounted?
  json.supplier @product.supplier