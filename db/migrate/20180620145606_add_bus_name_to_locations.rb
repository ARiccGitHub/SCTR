class AddBusNameToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :bus_name, :string
  end
end
