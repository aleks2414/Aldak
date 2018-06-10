class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :provider
  belongs_to :charter

  def order_id
    order.try(:numero_de_orden)
  end

  def order_id=(numero_de_orden)
    self.order = Order.find_by_numero_de_orden(numero_de_orden) if numero_de_orden.present?
  end


  before_save :cod_remision
  before_save :gasto_op

  def cod_remision
    self.codigo_remision = "#{self.order.client.try(:codigo_empresa)} - #{self.order.client.try(:codigo_planta)} - #{self.order.product.try(:codigo_producto)} - #{self.fecha_de_entrega} - #{self.id}"
  end

  def gasto_op
    self.gasto_operacion = self.pago_a_fletera + self.pago_a_proveedor
  end

end
