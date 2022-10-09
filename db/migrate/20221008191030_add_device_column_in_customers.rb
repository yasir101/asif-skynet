class AddDeviceColumnInCustomers < ActiveRecord::Migration[6.1]
  def up 
    add_column :customers, :device_name, :string
    add_column :customers, :serial_no, :string
    add_column :customers, :model, :string
    add_column :customers, :mac_address, :string
  end
  
  def down
    remove_column :customers, :device_name
    remove_column :customers, :serial_no
    remove_column :customers, :model
    remove_column :customers, :mac_address
  end
end
