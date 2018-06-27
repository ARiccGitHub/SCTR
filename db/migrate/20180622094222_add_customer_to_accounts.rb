class AddCustomerToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :customer, :refernces
  end
end
