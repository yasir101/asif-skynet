class Customer < ApplicationRecord  
  belongs_to :service, optional: true
  belongs_to :company, optional: true
  belongs_to :purchase_package, optional: true
  belongs_to :package, optional: true
  belongs_to :country, optional: true
  belongs_to :city, optional: true
  belongs_to :area, optional: true
  belongs_to :sub_area, optional: true  
  belongs_to :staff, optional: true  
  belongs_to :internet_type, optional: true
  
  has_many :subscriptions
  has_many :receivings
  
  scope :status, -> { where(status: true) } 
  scope :deactivated, -> { where(status: false) }
  scope :new_customer, -> { where("created_at >= ?", 1.month.ago.utc) }
  scope :subscribed_customer, -> { joins(:subscriptions).where(subscriptions: {status: :subscribed}) }
  scope :expired_subscriptioned_customer, -> { joins(:subscriptions).where(subscriptions: {status: :expired}) }
  
  after_create :sent_welcome_message

  def sent_welcome_message
    puts 'Sms service'
    sms = SMSService.new(self.id, self.name, self.mobile_primary)
    response = sms.send_message
    if response == '200'
      puts response      
      self.update_attribute :welcome_message, true
    end
    puts 'done'
  end
  
  def get_package_price
    self.package_discounted_price.nil? ? self.package.price : self.package.price.to_i - self.package_discounted_price.to_i
  end
end
