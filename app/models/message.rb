class Message < ApplicationRecord
  before_create :deliver_sms
  
  def deliver_sms
    self.number
    raise
    # sms = SMSService.new()
  end
end
