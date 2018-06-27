class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :customer_number
      t.string :machine_number
      t.string :model
      t.string :serial_number

      t.timestamps
    end
    add_index :machines, :customer_number
  end
end
