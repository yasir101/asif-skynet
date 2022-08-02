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
      t.timestamps
    end
  end
end
