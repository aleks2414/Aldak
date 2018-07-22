class AddAtributesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :nombre, :string
  end
end
