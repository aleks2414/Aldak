class AddPrecioToCharter < ActiveRecord::Migration[5.1]
  def change
    add_column :charters, :precio_de_envio, :integer, default: 0
  end
end
