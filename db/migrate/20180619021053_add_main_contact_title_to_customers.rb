class AddMainContactTitleToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :main_contact_title, :string
  end
end
