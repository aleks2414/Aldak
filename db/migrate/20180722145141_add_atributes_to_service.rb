class AddAtributesToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :total_venta, :float, default: 0
    add_column :services, :ganancia, :float, default: 0
  end
end
