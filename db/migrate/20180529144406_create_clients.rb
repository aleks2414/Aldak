class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.references :user, foreign_key: true
      t.string :alias
      t.string :rfc
      t.string :razon_social
      t.string :direccion
      t.string :planta
      t.string :codigo_empresa
      t.string :codigo_planta
      t.string :numero_proveedor

      t.timestamps
    end
  end
end
