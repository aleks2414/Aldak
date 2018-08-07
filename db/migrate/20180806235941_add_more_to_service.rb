class AddMoreToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :proveedor, :float, default: 0.0
    add_column :services, :fletera, :float, default: 0.0
    add_column :services, :iva_proveedor, :float, default: 0.0
    add_column :services, :iva_fletera, :float, default: 0.0
  end
end
