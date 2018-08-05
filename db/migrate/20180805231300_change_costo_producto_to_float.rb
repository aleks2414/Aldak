class ChangeCostoProductoToFloat < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :costo_producto, :float, default: 0.0
  end
end
