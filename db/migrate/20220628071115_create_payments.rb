class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :staff
      t.integer :amount
      t.date :date
      t.string :payment_mode
      t.string :purpose
      t.text :reason
      t.timestamps
    end
  end
end
