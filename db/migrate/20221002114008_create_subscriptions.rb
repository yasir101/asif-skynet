class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :customer
      t.date :start_date
      t.date :expiry_date
      t.string :subscription_type
      t.integer :no_of_days, default: 0
      t.integer :status
      t.boolean :renew, default: false
      t.integer :profit, dafault: 0                          
      t.timestamps
    end
  end
end
