class Image < ApplicationRecord
  def product
    Product.find_by(product_id: id)
  end 
end
