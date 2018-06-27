class CreateMachineNews < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_news do |t|
      t.string :machine_number
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
