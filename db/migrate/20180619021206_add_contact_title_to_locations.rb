class AddContactTitleToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :contact_title, :string
  end
end
