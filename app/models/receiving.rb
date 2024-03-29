class Receiving < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :staff, optional: true
  belongs_to :receipt_book, optional: true
  belongs_to :receipt_book_page, optional: true
  
  after_create :add_bill
  after_create :update_customer
  
  def add_bill
    receipt_book_page = ReceiptBookPage.find_by(id: self.receipt_book_page_id)
    receipt_book_page.update_attribute(:amount, self.amount_received);
  end
  
  def update_customer
    customer = Customer.find_by(id: self.customer_id)
    customer.update_attribute :first_receiving, true
  end
end
