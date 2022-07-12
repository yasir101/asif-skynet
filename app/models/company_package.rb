class CompanyPackage < ApplicationRecord
  validates :company_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  
  belongs_to :company
  has_one :package
end
