class AddNumberToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :customer_nember, :string
    add_column :machines, :serial_number, :string
  end
end
