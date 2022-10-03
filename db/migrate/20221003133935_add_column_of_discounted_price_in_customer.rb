class AddColumnOfDiscountedPriceInCustomer < ActiveRecord::Migration[6.1]
  def up
    add_column :customers, :package_discounted_price, :integer, default: nil
  end
  
  def down
    remove_column :customers, :package_discounted_price
  end
end
