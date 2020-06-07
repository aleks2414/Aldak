class AddSalesPriceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :precio_de_venta, :float, default: 0
  end
end
