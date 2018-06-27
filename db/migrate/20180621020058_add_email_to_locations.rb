class AddEmailToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :email, :string
  end
end
