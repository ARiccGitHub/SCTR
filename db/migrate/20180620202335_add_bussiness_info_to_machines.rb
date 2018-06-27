class AddBussinessInfoToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :bus_name, :string
    add_column :machines, :location_name, :string
    add_column :machines, :location_contact_phone, :string
    add_column :machines, :location_contact_name, :string
    add_column :machines, :on_location, :string
    add_reference :machines, :customer, foreign_key: true
    add_reference :machines, :location, foreign_key: true
  end
end
