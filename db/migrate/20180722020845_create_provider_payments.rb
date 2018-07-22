class CreateProviderPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :provider_payments do |t|
      t.references :provider, foreign_key: true
      t.integer :cantidad, default: 0
      t.date :fecha

      t.timestamps
    end
  end
end
