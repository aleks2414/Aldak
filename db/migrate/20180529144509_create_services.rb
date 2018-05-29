class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.float :cantidad
      t.date :fecha_de_entrega
      t.string :status_operativo
      t.string :status_comercial
      t.string :etapa
      t.references :provider, foreign_key: true
      t.boolean :requiere_factura_p
      t.float :pago_a_proveedor
      t.text :condiciones_p
      t.boolean :pagado_proveedor
      t.references :charter, foreign_key: true
      t.boolean :requiere_factura_f
      t.float :pago_a_fletera
      t.text :condiciones_f
      t.boolean :pagado_fletera
      t.string :codigo_remision
      t.boolean :remision_enviada
      t.boolean :calidad_enviada
      t.boolean :seguridad_enviada
      t.boolean :otro_enviada
      t.float :gasto_operacion
      t.boolean :remision_sellada
      t.boolean :tickets
      t.float :cantidad_real_etregada
      t.float :pago_real_p
      t.boolean :factura_recibida_p
      t.boolean :factura_recibida_f
      t.string :gr
      t.string :numero_de_factura
      t.float :kilos_finales
      t.float :total_por_facturar
      t.date :fecha_de_facturacion
      t.date :fecha_por_cobrar
      t.boolean :pagado

      t.timestamps
    end
  end
end
