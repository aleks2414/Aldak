class Provider < ApplicationRecord
  SEARCH_FIELDS = %i( alias rfc razon_social direccion encargado telefono_encargado correo_encargado codigo_proveedor )
  searchkick word_middle: SEARCH_FIELDS
  
  default_scope { where(user_id: User.current.company.users.pluck(:id)) }

  belongs_to :user
  has_many :services
  has_many :provider_payments

  enum status: %w( Debo Debe )

  def balance
    n1 = provider_payments.map(&:cantidad).sum
    n2 = services.map(&:proveedor).sum
    n2 - n1
  end

  def set_status
    balance >= 0 ? 'Debo' : 'Debe'
  end
end
