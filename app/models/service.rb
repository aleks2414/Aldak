class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :provider
  belongs_to :charter




  before_save :cod_remision
  before_save :gasto_op
  before_save :total_venta
  before_save :status_com
  before_save :etapa
  before_save :pago_a_proveedor
  before_save :ganancia

  def cod_remision
    self.codigo_remision = "#{self.order.client.try(:codigo_empresa)}-#{self.order.client.try(:codigo_planta)}-#{self.order.product.try(:codigo_producto)}-#{self.try(:fecha_de_entrega)}-0#{self.try(:id)}"
  end

  def pago_a_proveedor
    if requiere_factura_p == true
    self.pago_a_proveedor = (self.cantidad_real_etregada * self.order.product.try(:costo_producto)) * 1.16
    else
    self.pago_a_proveedor = self.cantidad_real_etregada * self.order.product.try(:costo_producto)
    end
  end

  def gasto_op
    if requiere_factura_f == true
    self.gasto_operacion = self.charter.try(:precio_de_envio) * 1.16 + self.pago_a_proveedor
    else
    self.gasto_operacion = self.charter.try(:precio_de_envio) + self.pago_a_proveedor
    end
  end

  def total_venta
    self.total_venta = (self.try(:cantidad_real_etregada) * self.order.try(:precio_unitario)) * 1.16
  end

  def ganancia
    self.ganancia = self.try(:total_venta) - self.try(:gasto_operacion)

  end

  def status_com
    if self.pagado == true 
      self.status_comercial = "Cobrado"
    else 
      self.status_comercial = "Por Cobrar"
    end
  end


  def etapa
    if self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.remision_enviada == true && self.calidad_enviada == true && self.seguridad_enviada == true && self.pago_a_proveedor > 0 && self.pago_a_fletera > 0 && self.gasto_operacion > 0 && self.gr.present? && self.numero_de_factura.present?  && self.fecha_de_facturacion.present?
      self.etapa = 6
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.remision_enviada == true && self.calidad_enviada == true && self.seguridad_enviada == true && self.pago_a_proveedor > 0 && self.pago_a_fletera > 0 && self.gasto_operacion > 0 && self.gr.present?
      self.etapa = 5
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.remision_enviada == true && self.calidad_enviada == true && self.seguridad_enviada == true && self.gasto_operacion > 0
      self.etapa = 4
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.remision_enviada == true && self.calidad_enviada == true && self.seguridad_enviada == true
      self.etapa = 3
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present?
      self.etapa = 2
    else 
      self.etapa = 1
    end
  end

  def month
  self.fecha_de_entrega.to_date.strftime('%G-%B')
  end

end
