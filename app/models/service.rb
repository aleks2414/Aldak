class Service < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :provider
  belongs_to :charter




  before_save :cod_remision
  before_save :gasto_op
  before_save :status_com
  before_save :etapa

  def cod_remision
    self.codigo_remision = "#{self.order.client.try(:codigo_empresa)}-#{self.order.client.try(:codigo_planta)}-#{self.order.product.try(:codigo_producto)}-#{self.fecha_de_entrega}-#{self.id}"
  end

  def gasto_op
    self.gasto_operacion = self.pago_a_fletera + self.pago_a_proveedor
  end

  def status_com
    if self.pagado == true 
      self.status_comercial = "Cobrado"
    else 
      self.status_comercial = "Por Cobrar"
    end
  end


  def etapa
    if self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.remision_enviada == true && self.calidad_enviada == true && self.seguridad_enviada == true && self.pago_a_proveedor > 0 && self.pago_a_fletera > 0 && self.gasto_operacion > 0 && self.gr.present? && self.numero_de_factura.present? && self.kilos_finales.present? && self.total_por_facturar > 0 && self.fecha_de_facturacion.present?
      self.etapa = 6
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.remision_enviada == true && self.calidad_enviada == true && self.seguridad_enviada == true && self.pago_a_proveedor > 0 && self.pago_a_fletera > 0 && self.gasto_operacion > 0 && self.gr.present?
      self.etapa = 5
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.remision_enviada == true && self.calidad_enviada == true && self.seguridad_enviada == true && self.pago_a_proveedor > 0 && self.pago_a_fletera > 0 && self.gasto_operacion > 0
      self.etapa = 4
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present? && self.remision_enviada == true && self.calidad_enviada == true && self.seguridad_enviada == true
      self.etapa = 3
    elsif self.cantidad > 0 && self.fecha_de_entrega.present? && self.provider.present? && self.charter.present?
      self.etapa = 2
    else 
      self.etapa = 1
    end
  end

end
