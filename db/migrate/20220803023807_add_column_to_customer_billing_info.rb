class AddColumnToCustomerBillingInfo < ActiveRecord::Migration[6.1]
  def up
    add_column :customer_billing_infos, :days, :string
    add_column :customer_billing_infos, :promise_date, :date
  end
end
