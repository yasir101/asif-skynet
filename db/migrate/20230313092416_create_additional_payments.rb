class CreateAdditionalPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :additional_payments do |t|
      t.references :customer
      t.integer :router_charges
      t.integer :wire_charges
      t.integer :installement_charges
      t.boolean :additional_payment

      t.timestamps
    end
  end
end
