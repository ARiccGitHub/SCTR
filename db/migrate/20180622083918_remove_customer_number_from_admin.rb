class RemoveCustomerNumberFromAdmin < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :customer_number, :string
  end
end
