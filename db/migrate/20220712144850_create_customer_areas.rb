class CreateCustomerAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_areas do |t|
      t.references :customer
      t.references :country
      t.references :city
      t.references :area
      t.references :sub_area
      t.string :house_no
      t.string :street
      t.text :address
      t.text :remarks
      t.timestamps
    end
  end
end
