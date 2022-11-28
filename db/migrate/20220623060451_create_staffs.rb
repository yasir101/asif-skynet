class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.references :staff_type
      t.references :blood_group
      t.string :full_name
      t.string :father_name
      t.date :dob
      t.string :cnic
      t.string :mobile_primary
      t.string :mobile_secondary
      t.text :address
      t.text :remarks
      t.date :joining
      t.integer :starting_salary
      t.integer :current_salary
      t.string :official_mobile_no
      t.string :official_mobile_model
      t.string :official_moterbike_no
      t.text :others
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
