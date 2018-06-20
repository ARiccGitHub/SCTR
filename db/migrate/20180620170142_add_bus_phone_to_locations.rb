class AddBusPhoneToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :bus_phone, :string
  end
end
