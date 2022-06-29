class CreateReceiptBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :receipt_books do |t|
      t.references :staff
      t.date :issue_date
      t.integer :book_number
      t.integer :from
      t.integer :total_pages
      t.integer :to
      t.string :status
      t.timestamps
    end
  end
end
