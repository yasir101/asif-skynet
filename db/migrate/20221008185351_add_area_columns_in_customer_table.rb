class AddAreaColumnsInCustomerTable < ActiveRecord::Migration[6.1]
  def up
    add_reference :customers, :country
    add_reference :customers, :city
    add_reference :customers, :area
    add_reference :customers, :sub_area
    add_column :customers, :house_no, :string
    add_column :customers, :street, :string
    add_column :customers, :address, :text
    add_column :customers, :remarks, :text
    add_column :customers, :pon_no, :string
  end
  
  def down
    remove_column :table_name, :country_id
    remove_column :table_name, :city_id
    remove_column :table_name, :area_id
    remove_column :table_name, :sub_area_id
    remove_column :table_name, :house_no
    remove_column :table_name, :street
    remove_column :table_name, :address
    remove_column :table_name, :remarks
    remove_column :table_name, :pon_no
  end
end
