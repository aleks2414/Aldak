class Order < ApplicationRecord
   
  default_scope { where(user_id: User.current.company.users.pluck(:id)) }

  belongs_to :user
  has_many :services

  before_save :valor_total
  before_save :iva_pedido


  def valor_total
    self.valor_total =  (self.cantidad * self.precio_unitario)*1.16
  end

  def iva_pedido
    self.iva_pedido =  (self.cantidad * self.precio_unitario)*0.16
  end

end
