class CreateServiceCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :service_calls do |t|
      t.references :location, foreign_key: true
      t.references :account, foreign_key: true
      t.string :customer_number
      t.string :description
      t.timestamps
    end
  end
end
