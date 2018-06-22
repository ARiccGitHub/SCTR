class RemoveCustomerFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :customer, :refernces
  end
end
