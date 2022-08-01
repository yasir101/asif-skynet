class CreateCustomerBillingInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_billing_infos do |t|
      t.references :customer
      t.string :billing_type
      t.date :billing_date
      t.timestamps
    end
  end
end
