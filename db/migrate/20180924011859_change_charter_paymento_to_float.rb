class ChangeCharterPaymentoToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :charter_payments, :cantidad, :float
  end
end
