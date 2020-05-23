class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order, optional: true
  belongs_to :provider
  belongs_to :charter
  belongs_to :product
  belongs_to :client


  before_save :gasto_operacion
  before_save :total_venta
  before_save :status_com
  before_save :etapa
  before_save :ganancia
  before_save :proveedor
  before_save :fletera
  before_save :iva_proveedor
  before_save :iva_fletera
  validate :fecha_entregable

def fecha_entregable
  if self.fecha_de_entrega < (Time.zone.now - 2.month) || self.fecha_de_entrega > (Time.zone.now + 2.month)
    errors.add(:service_id, "No se puede crear una remisión de más o menos de 2 meses de distancia") 
  end 
end


def get_code
  number = 0
  codigo = ''

  loop do
    number += 1
    codigo = "#{self.client.try(:codigo_empresa)}-#{self.product.try(:codigo_producto)}-#{DateTime.now.strftime("%d-%m-%Y")}-#{'%02d' % number}"
    break if Service.find_by(codigo_remision: codigo).nil?
  end

  codigo
end

  def proveedor
    self.proveedor =  self.cantidad_real_etregada * self.product.costo_producto
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
    if self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.pago_a_proveedor > 0 && self.pago_a_fletera > 0 && self.gasto_operacion > 0 && self.gr.present? && self.numero_de_factura.present?  && self.fecha_de_facturacion.present?
      self.etapa = 6
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.pago_a_proveedor > 0 && self.pago_a_fletera > 0 && self.gasto_operacion > 0 && self.gr.present?
      self.etapa = 5
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.gasto_operacion > 0
      self.etapa = 4
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present?
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

  def year
    self.fecha_de_entrega.to_date.strftime('%Y')
  end

end
