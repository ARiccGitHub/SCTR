class AddBusNameToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :bus_name, :string
  end
end
