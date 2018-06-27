class RemoveCustomerFromMachines < ActiveRecord::Migration[5.2]
  def change
    remove_reference :machines, :customer, foreign_key: true
  end
end
