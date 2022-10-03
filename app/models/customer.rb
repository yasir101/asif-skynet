class Customer < ApplicationRecord
  belongs_to :service, optional: true
  
  belongs_to :company, optional: true
  belongs_to :purchase_package, optional: true
  belongs_to :package, optional: true
  
  has_one :customer_area
  accepts_nested_attributes_for :customer_area
  
  has_one :customer_device_info
  accepts_nested_attributes_for :customer_device_info
  
  belongs_to :staff, optional: true

  has_many :subscriptions
  accepts_nested_attributes_for :subscriptions
  
  has_many :receivings

  after_create :initialize_related?
  
  def initialize_related?
    create_customer_area
    create_subscription
    create_customer_device_info
  end
end
