class AddResidanceColumnToCustomer < ActiveRecord::Migration[6.1]
  def up
    add_column :customers, :residance, :string
    add_column :customers, :welcome_message, :boolean, default: false
    add_column :customers, :first_receiving, :boolean, default: false
    
  end
  
  def down
    remove_column :customers, :residance
    remove_column :customers, :welcome_message
    remove_column :customers, :first_receiving
  end
end
