class Subscription < ApplicationRecord
  enum status: { no_subscription: 0, subscribed: 1, expired: 2 }
  belongs_to :customer
end
