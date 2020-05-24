class Provider < ApplicationRecord
  searchkick
  
  belongs_to :user
  has_many :services
  has_many :provider_payments

  enum status: %w( debo debe )

  def set_status
    n1 = provider_payments.map(&:cantidad).sum
    n2 = services.map(&:proveedor).sum + services.map(&:iva_proveedor).sum
    n1 - n2 >= 0 ? 'debe' : 'debo'
  end
end
