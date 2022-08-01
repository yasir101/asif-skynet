class CustomerPackage < ApplicationRecord
  belongs_to :package, optional: true
  belongs_to :customer
end
