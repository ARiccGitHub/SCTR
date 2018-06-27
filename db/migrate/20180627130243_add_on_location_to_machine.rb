class AddOnLocationToMachine < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :on_location, :string
  end
end
