class CreateCustomerPackages < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_packages do |t|
      t.references :customer 
      t.references :package
      t.string :username
      t.string :password
      t.date :expiry 
      t.timestamps
    end
  end
end
