class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :customer_number
      t.string :suite
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country


      t.string :contact__first_name
      t.string :contact__last_name
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
    add_index :locations, :customer_number
  end
end
