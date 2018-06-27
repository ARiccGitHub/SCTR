class RemoveCustomerNemberFromMachine < ActiveRecord::Migration[5.2]
  def change
    remove_column :machines, :customer_nember, :string
  end
end
