class CreateCustomerDeviceInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_device_infos do |t|
      t.references :customer
      t.string :device_name
      t.string :serial_no
      t.string :model
      t.string :mac_address
      t.timestamps
    end
  end
end
