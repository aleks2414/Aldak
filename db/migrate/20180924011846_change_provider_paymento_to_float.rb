class ChangeProviderPaymentoToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :provider_payments, :cantidad, :float
  end
end
