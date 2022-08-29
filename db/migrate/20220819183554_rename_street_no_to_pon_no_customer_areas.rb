class RenameStreetNoToPonNoCustomerAreas < ActiveRecord::Migration[6.1]
  def up
    rename_column :customer_areas, :street, :pon_no
  end
  
  def down
    rename_column :customer_areas, :pon_no, :street
  end
end
