class Provider < ApplicationRecord
  SEARCH_FIELDS = %i( alias rfc razon_social direccion encargado telefono_encargado correo_encargado codigo_proveedor )
  searchkick word_middle: SEARCH_FIELDS
  
  belongs_to :user
  has_many :services
  has_many :provider_payments

  enum status: %w( debo debe )

  def balance
    n1 = provider_payments.map(&:cantidad).sum
    n2 = services.map(&:proveedor).sum + services.map(&:iva_proveedor).sum
    n1 - n2
  end

  def set_status
    balance >= 0 ? 'debe' : 'debo'
  end
end
