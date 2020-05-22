class Provider < ApplicationRecord
  belongs_to :user
  has_many :services
  has_many :provider_payments

  enum status: %w( debo debe )
end
