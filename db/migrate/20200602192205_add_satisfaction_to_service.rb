class AddSatisfactionToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :satisfaction, :integer
  end
end
