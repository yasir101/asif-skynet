class CreateReceiptBookPages < ActiveRecord::Migration[6.1]
  def change
    create_table :receipt_book_pages do |t|
      t.references :receipt_book
      t.integer :page_no
      t.integer :amount
      t.timestamps
    end
  end
end
