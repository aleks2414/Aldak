class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer, default: 0
    remove_column :users, :admin, :boolean, default: false
  end
end
