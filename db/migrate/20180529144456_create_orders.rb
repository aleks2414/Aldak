class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.references :product, foreign_key: true
      t.string :numero_de_orden
      t.date :fecha_de_orden
      t.string :nombre_encargado
      t.float :cantidad, dafault: 0.0
      t.string :descripcion
      t.float :precio_unitario, dafault: 0.0
      t.float :valor_total, dafault: 0.0

      t.timestamps
    end
  end
end
