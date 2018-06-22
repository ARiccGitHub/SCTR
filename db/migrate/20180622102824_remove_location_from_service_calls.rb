class RemoveLocationFromServiceCalls < ActiveRecord::Migration[5.2]
  def change
    remove_reference :service_calls, :location, foreign_key: true
  end
end
