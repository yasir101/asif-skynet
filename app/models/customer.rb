class Customer < ApplicationRecord
  belongs_to :service
  
  has_one :customer_area
  accepts_nested_attributes_for :customer_area
  
  has_one :customer_package
  accepts_nested_attributes_for :customer_package
  
  after_create :initialize_related
  
  def initialize_related
    create_customer_area
    create_customer_package
  end
end
