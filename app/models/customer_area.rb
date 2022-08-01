class CustomerArea < ApplicationRecord
  belongs_to :customer
  belongs_to :country
  belongs_to :city
  belongs_to :area
  belongs_to :sub_area
end
