class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.float :cantidad, default: 0.0
      t.date :fecha_de_entrega
      t.string :status_operativo
      t.string :status_comercial
      t.string :etapa
      t.references :provider, foreign_key: true
      t.boolean :requiere_factura_p, default:false
      t.float :pago_a_proveedor, default: 0.0
      t.text :condiciones_p
      t.boolean :pagado_proveedor, default:false
      t.references :charter, foreign_key: true
      t.boolean :requiere_factura_f, default:false
      t.float :pago_a_fletera, default: 0.0
      t.text :condiciones_f
      t.boolean :pagado_fletera, default:false
      t.string :codigo_remision
      t.boolean :remision_enviada, default:false
      t.boolean :calidad_enviada, default:false
      t.boolean :seguridad_enviada, default:false
      t.boolean :otro_enviada, default:false
      t.float :gasto_operacion, default: 0.0
      t.boolean :remision_sellada, default:false
      t.boolean :tickets, default:false
      t.float :cantidad_real_etregada, default: 0.0
      t.float :pago_real_p, default: 0.0
      t.boolean :factura_recibida_p, default:false
      t.boolean :factura_recibida_f, default:false
      t.string :gr
      t.string :numero_de_factura
      t.float :kilos_finales, default: 0.0
      t.float :total_por_facturar, default: 0.0
      t.date :fecha_de_facturacion
      t.date :fecha_por_cobrar
      t.boolean :pagado, default:false

      t.timestamps
    end
  end
end
