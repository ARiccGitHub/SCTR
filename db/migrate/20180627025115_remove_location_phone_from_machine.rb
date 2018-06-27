class RemoveLocationPhoneFromMachine < ActiveRecord::Migration[5.2]
  def change
    remove_column :machines, :location_phone, :string
  end
end
