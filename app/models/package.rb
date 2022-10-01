class Package < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true  
  
  has_many :customers
end
