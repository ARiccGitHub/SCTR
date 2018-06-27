class RemoveDescriptionFromServiceCalls < ActiveRecord::Migration[5.2]
  def change
    remove_column :service_calls, :description, :string
  end
end
