class Staff < ApplicationRecord
  acts_as_paranoid
  
  validates :full_name, presence: true
  validates :staff_type_id, presence: true
  validates :starting_salary, presence: true
  validates :current_salary, presence: true
  
  belongs_to :staff_type
  belongs_to :blood_group
  
  has_many :payments
  has_many :receipt_books
  
  has_many :customers
  has_many :receivings
  
  after_create :register_staff
  
  def register_staff
    username = self.full_name.parameterize.underscore
    email = "#{username}@skynet.com"
    password = self.mobile_primary.last(4)
    type = self.staff_type.name
     
    staff = Admin.create!(username: username, email: email, password: password)
    
    staff.add_role :admin if type.downcase == 'admin'
    
    staff.add_role :staff 
  end
end
