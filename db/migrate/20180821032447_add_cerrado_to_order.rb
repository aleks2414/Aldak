class AddCerradoToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :cerrado, :boolean, default: false
  end
end
