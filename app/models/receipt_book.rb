class ReceiptBook < ApplicationRecord
  validates :from, presence: true, uniqueness: true
  validates :total_pages, presence: true
  validates :book_number, presence: true, uniqueness: true
  validates :issue_date, presence: true
  
  has_many :receipt_book_pages
  accepts_nested_attributes_for :receipt_book_pages
  
  belongs_to :staff
  
  has_many :receivings
end
