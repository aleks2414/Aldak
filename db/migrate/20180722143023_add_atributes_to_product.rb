class AddAtributesToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :costo_producto, :integer, default: 0
    add_column :products, :alias, :string
  end
end
