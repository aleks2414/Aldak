class RemoveColumnsFromService < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :remision_enviada, :boolean
    remove_column :services, :calidad_enviada, :boolean
    remove_column :services, :seguridad_enviada, :boolean
    remove_column :services, :otro_enviada, :boolean
    remove_column :services, :remision_sellada, :boolean
    remove_column :services, :tickets, :boolean
    remove_column :services, :condiciones_p, :text
    remove_column :services, :condiciones_f, :text
    remove_column :services, :factura_recibida_p, :boolean
    remove_column :services, :factura_recibida_f, :boolean
  end
end
