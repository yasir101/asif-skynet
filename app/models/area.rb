class Area < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :city_id, presence: true
  
  belongs_to :city
  
  has_many :sub_areas
  has_many :customer_areas
end
