class AddDescriptionToServiceCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :service_calls, :description, :text
  end
end
