class ChangeMachineNewsToMachines < ActiveRecord::Migration[5.2]
  def change
    rename_table :machine_news, :machines
  end
end
