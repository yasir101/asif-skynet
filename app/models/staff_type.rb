class StaffType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :staff
end
