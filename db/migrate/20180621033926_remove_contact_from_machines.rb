class RemoveContactFromMachines < ActiveRecord::Migration[5.2]
  def change
    remove_column :machines, :location_name, :string
    remove_column :machines, :contact_contact_phone, :string
    remove_column :machines, :contact_contact_name, :string
    remove_column :machines, :bus_name, :string
  end
end
