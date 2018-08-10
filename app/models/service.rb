class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :provider
  belongs_to :charter




  before_save :cod_remision
  before_save :gasto_operacion
  before_save :total_venta
  before_save :status_com
  before_save :etapa
  before_save :ganancia
  before_save :proveedor
  before_save :fletera
  before_save :iva_proveedor
  before_save :iva_fletera

  def cod_remision
    self.codigo_remision = "#{self.order.client.try(:codigo_empresa)}-#{self.order.client.try(:codigo_planta)}-#{self.order.product.try(:codigo_producto)}-#{self.try(:fecha_de_entrega).strftime(" %d-%m-%Y")}-0#{self.try(:id)}"
  end

  def proveedor
    self.proveedor =  self.cantidad_real_etregada * self.order.product.costo_producto
  end

  def iva_proveedor
    if requiere_factura_p == true 
      self.iva_proveedor = self.proveedor * 0.16
    else
      self.iva_proveedor = 0
    end
  end 

def fletera
  self.fletera = self.charter.precio_de_envio
end

  def iva_fletera
    if requiere_factura_p == true 
      self.iva_fletera = self.fletera * 0.16
    else
      self.iva_fletera = 0
    end
  end 

  def gasto_operacion
    self.gasto_operacion = self.proveedor + self.iva_proveedor + self.fletera + self.iva_fletera
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
