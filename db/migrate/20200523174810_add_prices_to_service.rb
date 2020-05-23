class AddPricesToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :precio_de_venta, :integer
    add_column :services, :precio_de_compra, :integer
  end
end
