class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :customers
  has_many :purchase_packages
  
  has_many :company_packages 
end
