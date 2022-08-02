class CustomerArea < ApplicationRecord
  belongs_to :customer
  belongs_to :country, optional: true
  belongs_to :city, optional: true
  belongs_to :area, optional: true
  belongs_to :sub_area, optional: true
end
