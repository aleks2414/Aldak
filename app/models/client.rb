class Client < ApplicationRecord
  SEARCH_FIELDS = %i( alias rfc razon_social direccion planta codigo_empresa codigo_planta numero_proveedor )
  searchkick word_middle: SEARCH_FIELDS
  
  default_scope { where(user_id: User.current.company.users.pluck(:id)) }

  belongs_to :user
  has_many :services
end
