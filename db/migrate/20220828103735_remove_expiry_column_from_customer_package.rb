class RemoveExpiryColumnFromCustomerPackage < ActiveRecord::Migration[6.1]
  def up
    remove_column :customer_packages, :expiry
  end
  
  def down
    add_column :customer_packages, :expiry, :date
  end
end
