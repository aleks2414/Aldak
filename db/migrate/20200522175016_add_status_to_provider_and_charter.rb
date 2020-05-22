class AddStatusToProviderAndCharter < ActiveRecord::Migration[6.0]
  def change
    add_column :charters, :status, :integer
    add_column :providers, :status, :integer
  end
end
