class Product < ApplicationRecord
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0 }
  validates :name, presence: true 
  validates :name, uniqueness: true
  validates :description, length: { in: 10..500}

  has_many :category_products 
   
  
  def tax 
    tax = price * 0.09
  end

  def total
    total = price + tax
  end 

  def is_discounted?
    price < 10 
  end 

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :images
  # def images
  #   Image.where(product_id: id) 
  # end 

  def image_url_list 
    images.map { |image| image.url}
  end 

  has_many :orders

end
