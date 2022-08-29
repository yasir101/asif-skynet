class AddColumnsToCustomerPackages < ActiveRecord::Migration[6.1]
  def up
    add_reference :customer_packages, :company
    add_reference :customer_packages, :company_package
  end
  
  def down
    remove_column :customer_packages, :company_id
    remove_column :customer_packages, :company_package_id
  end
end
