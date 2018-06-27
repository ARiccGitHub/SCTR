class AddReferenceToServiceCalls < ActiveRecord::Migration[5.2]
  def change
    add_reference :service_calls, :account, foreign_key: true
    add_reference :service_calls, :location, foreign_key: true
    add_reference :service_calls, :machine, foreign_key: true
  end
end
