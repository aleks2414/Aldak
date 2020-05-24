class Charter < ApplicationRecord
  SEARCH_FIELDS = %i( alias rfc razon_social direccion encargado telefono_encargado correo_encargado codigo_fletera )
  searchkick word_middle: SEARCH_FIELDS
  
  belongs_to :user
  has_many :services
  has_many :charter_payments

  enum status: %w( debo debe )

  def set_status
    c1 = charter_payments.map(&:cantidad).sum
    c2 = services.map(&:charter).map(&:precio_de_envio).sum
    c1 - c2 >= 0 ? 'debe' : 'debo'
  end
end
