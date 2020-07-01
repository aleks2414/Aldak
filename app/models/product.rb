class Product < ApplicationRecord
  SEARCH_FIELDS = %i( alias nombre codigo_producto caracteristicas )
  searchkick word_middle: SEARCH_FIELDS
  
  default_scope { where(user_id: User.current.company.users.pluck(:id)) }

  belongs_to :user
  has_many :services


before_save :costo_producto
before_save :precio_de_venta

def costo_producto
	if self.cost_tax == true then self.costo_producto = self.base_cost_price * 1.160 else self.costo_producto = self.base_cost_price end
end




def precio_de_venta
	if self.sell_tax == true then self.precio_de_venta = self.base_sell_price * 1.160 else self.precio_de_venta = self.base_sell_price end
end

end
