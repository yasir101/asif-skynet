class AdditionalPayment < ApplicationRecord
  belongs_to :customer, optional: true
end
