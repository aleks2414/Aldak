class Client < ApplicationRecord
  searchkick
  
  belongs_to :user
  has_many :orders
  has_many :services
end
