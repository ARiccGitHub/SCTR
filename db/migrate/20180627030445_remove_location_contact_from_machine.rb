class RemoveLocationContactFromMachine < ActiveRecord::Migration[5.2]
  def change
    remove_column :machines, :location_contact_name, :string
    remove_column :machines, :location_contact_phone, :string
  end
end
