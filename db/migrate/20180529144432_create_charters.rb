class CreateCharters < ActiveRecord::Migration[5.1]
  def change
    create_table :charters do |t|
      t.references :user, foreign_key: true
      t.string :alias
      t.string :rfc
      t.string :razon_social
      t.string :direccion
      t.string :encargado
      t.string :telefono_encargado
      t.string :correo_encargado
      t.string :codigo_fletera

      t.timestamps
    end
  end
end
