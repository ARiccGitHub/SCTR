class CreatePermitAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :permit_accounts do |t|
      t.references :account, foreign_key: true
      t.integer :location

      t.timestamps
    end
  end
end
