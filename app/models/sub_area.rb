class SubArea < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :area_id, presence: true
  
  belongs_to :area
  has_many :customer_areas
end
