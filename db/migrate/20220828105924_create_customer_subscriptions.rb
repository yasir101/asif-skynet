class CreateCustomerSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_subscriptions do |t|
      t.references :customer
      t.references :customer_package
      t.date :start_date
      t.date :expiry_date
      t.boolean :status, default: false
      t.boolean :renew, default: false
      t.float :profit            
      t.timestamps
    end
  end
end
