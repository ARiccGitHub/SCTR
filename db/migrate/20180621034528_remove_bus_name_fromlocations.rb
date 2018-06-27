class RemoveBusNameFromlocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :bus_name, :string
    remove_column :locations, :bus_phone, :string
  end
end
