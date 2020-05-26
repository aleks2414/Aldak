class Product < ApplicationRecord
  SEARCH_FIELDS = %i( alias nombre codigo_producto caracteristicas )
  searchkick word_middle: SEARCH_FIELDS
  
  belongs_to :user
  has_many :orders
  has_many :services
end
