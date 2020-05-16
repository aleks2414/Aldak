class RemoveProductAndClientFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :client, null: false, foreign_key: true
    remove_reference :orders, :product, null: false, foreign_key: true
  end
end
