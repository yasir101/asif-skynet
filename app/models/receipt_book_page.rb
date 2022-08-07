class ReceiptBookPage < ApplicationRecord
  belongs_to :receipt_book
  
  has_many :receivings
end
