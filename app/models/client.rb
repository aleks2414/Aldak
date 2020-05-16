class Client < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :services
end
