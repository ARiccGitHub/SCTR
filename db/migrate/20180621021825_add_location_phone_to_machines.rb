class AddLocationPhoneToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :location_phone, :string
  end
end
