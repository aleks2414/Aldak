class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :nombre
      t.string :codigo_producto
      t.string :caracteristicas

      t.timestamps
    end
  end
end
