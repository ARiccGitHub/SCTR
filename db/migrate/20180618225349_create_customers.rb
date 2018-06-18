class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :customer_number
      t.string :name
      t.string :suite
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country


      t.string :main_contact__first_name
      t.string :main_contact__last_name
      t.string :main_contact_phone
      t.string :main_contact_email

      t.timestamps
    end
    add_index :customers, :customer_number
  end
end
