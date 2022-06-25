class Staff < ApplicationRecord
  validates :full_name, presence: true
  validates :staff_type_id, presence: true
  validates :starting_salary, presence: true
  validates :current_salary, presence: true
  
  belongs_to :staff_type
  belongs_to :blood_group
end
