class Package < ApplicationRecord
  validates :company_package_id, presence: true
  validates :name, presence: true
  validates :price, presence: true  
  
  belongs_to :company
  belongs_to :company_package
  has_one :customer_package
  
  def package_detail
    "(#{self.company.name} / #{self.company_package.name}) - #{self.name}"
  end
end
