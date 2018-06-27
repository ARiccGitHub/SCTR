class AddCustomerNumberToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :customer_number, :string
  end
end
