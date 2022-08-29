class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :customer_package, optional: true
end
