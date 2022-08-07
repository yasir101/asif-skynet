class Customer < ApplicationRecord
  belongs_to :service, optional: true
  
  has_one :customer_area
  accepts_nested_attributes_for :customer_area
  
  has_one :customer_package
  accepts_nested_attributes_for :customer_package
  
  has_one :customer_billing_info
  accepts_nested_attributes_for :customer_billing_info
  
  has_one :customer_device_info
  accepts_nested_attributes_for :customer_device_info
  
  belongs_to :staff, optional: true
  
  has_many :receivings
  
  after_create :initialize_related?
  
  def initialize_related?
    create_customer_area
    create_customer_package
    create_customer_billing_info
    create_customer_device_info
  end
end
