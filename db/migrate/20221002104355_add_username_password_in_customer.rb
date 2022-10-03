class AddUsernamePasswordInCustomer < ActiveRecord::Migration[6.1]
  def up
    add_column :customers, :username, :string
    add_column :customers, :password_text, :string
  end
  
  def down
    remove_column :customers, :username
    remove_column :customers, :password_text
  end
end
