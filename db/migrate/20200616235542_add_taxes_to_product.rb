class AddTaxesToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :base_cost_price, :float, default: 0
    add_column :products, :base_sell_price, :float, default: 0
    add_column :products, :cost_tax, :boolean, default: 0
    add_column :products, :sell_tax, :boolean, default: 0
  end
end
