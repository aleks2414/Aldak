class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.references :user, foreign_key: true
      t.string :alias
      t.string :rfc
      t.string :razon_social
      t.string :direccion
      t.string :encargado
      t.string :telefono_encargado
      t.string :correo_encargado
      t.string :codigo_proveedor

      t.timestamps
    end
  end
end
