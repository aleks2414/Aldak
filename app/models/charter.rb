class Charter < ApplicationRecord
  belongs_to :user
  has_many :services
  has_many :charter_payments
end
