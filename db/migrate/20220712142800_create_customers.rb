class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.integer :old_ref_no
      t.string :name
      t.string :father_name
      t.string :cnic
      t.string :mobile_primary 
      t.string :mobile_secondary
      t.references :service
      t.references :staff
      t.string :residance
      t.integer :promise_break_count, default: 0
      t.boolean :welcome_message, default: false
      t.boolean :first_receiving, default: false
      t.references :company
      t.references :purchase_package
      t.references :package
      t.string :username 
      t.string :password_text 
      t.integer :package_discounted_price, default: nil
      t.references :country
      t.references :area
      t.references :city
      t.references :sub_area
      t.string :house_no 
      t.string :street 
      t.text :address 
      t.text :remarks 
      t.string :pon_no
      t.string :device_name
      t.string :serial_no
      t.string :model
      t.string :mac_address
      t.references :internet_type
      t.datetime :username_expiry
      t.datetime :joining_date
      t.boolean :status, default: true      
      t.timestamps
    end
  end
end
