class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :provider
  belongs_to :charter
end
