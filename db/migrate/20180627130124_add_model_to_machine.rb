class AddModelToMachine < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :model, :string
  end
end
