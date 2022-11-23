class Subscription < ApplicationRecord
  enum status: [ :subscribed, :expired ]
  belongs_to :customer
end
