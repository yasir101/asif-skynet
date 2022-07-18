class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :cities
  has_many :customer_areas
end
