class Client < ApplicationRecord
  SEARCH_FIELDS = %i( alias rfc razon_social direccion planta codigo_empresa codigo_planta numero_proveedor )
  searchkick word_middle: SEARCH_FIELDS
  
  belongs_to :user
  has_many :orders
  has_many :services
end
