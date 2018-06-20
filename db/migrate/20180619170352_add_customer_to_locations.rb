class AddCustomerToLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :customer, foreign_key: true
  end
end
