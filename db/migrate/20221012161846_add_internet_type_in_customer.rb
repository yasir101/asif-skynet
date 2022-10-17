class AddInternetTypeInCustomer < ActiveRecord::Migration[6.1]
  def up
    add_reference :customers, :internet_type, index: true
  end
  
  def down
    remove_column :customers, :internet_type_id
  end
end
