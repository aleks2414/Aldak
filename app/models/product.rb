class Product < ApplicationRecord
  SEARCH_FIELDS = %i( alias nombre codigo_producto caracteristicas )
  searchkick word_middle: SEARCH_FIELDS
  
  default_scope { where(user_id: User.current.company.users.pluck(:id)) }

  belongs_to :user
  has_many :services
end
