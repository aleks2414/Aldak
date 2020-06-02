class Charter < ApplicationRecord
  SEARCH_FIELDS = %i( alias rfc razon_social direccion encargado telefono_encargado correo_encargado codigo_fletera )
  searchkick word_middle: SEARCH_FIELDS
  
  default_scope { where(user_id: User.current.company.users.pluck(:id)) }

  belongs_to :user
  has_many :services
  has_many :charter_payments

  enum status: %w( debo debe )

  def balance
    c1 = charter_payments.map(&:cantidad).sum
    c2 = services.map(&:charter).map(&:precio_de_envio).sum
    c1 - c2
  end

  def set_status
    balance >= 0 ? 'debe' : 'debo'
  end
end
