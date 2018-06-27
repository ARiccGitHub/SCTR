class CreateServiceCallsTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :service_calls do |t|
        t.string :customer_number, index: true
        t.string :description
      t.timestamps
    end
  end
end
