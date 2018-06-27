class CreateAccountsLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts_locations do |t|
      t.references :account, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
