class AddAttsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :iva_pedido, :float, default: 0.0
    add_column :orders, :closed, :boolean, default: false
  end
end
