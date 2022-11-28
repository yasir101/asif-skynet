class CreateReceivings < ActiveRecord::Migration[6.1]
  def change
    create_table :receivings do |t|
      t.references :customer
      t.references :staff
      t.integer :amount
      t.string :service
      t.references :receipt_book
      t.references :receipt_book_page
      t.date :receiving_date
      t.integer :balance, default: 0
      t.integer :discount, default: 0
      t.integer :amount_received, default: 0
      t.timestamps
    end
  end
end
