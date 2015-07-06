class Product < ActiveRecord::Base
	validates_presence_of :name, :description, :quantity, :selling_price, :cost_of_products, :weight, :thumbnail, :full_image
  has_many :comments, :dependent => :destroy
end
