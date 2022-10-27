class AddUsernameExpiryDateInCustomers < ActiveRecord::Migration[6.1]
  def up
    add_column :customers, :username_expiry, :date
    add_column :customers, :joining_date, :date
  end
  
  def down
    remove_column :customers, :username_expiry
    remove_column :customers, :joining_date
  end
end
