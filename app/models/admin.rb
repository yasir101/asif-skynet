class Admin < ApplicationRecord
  rolify
  after_create :assign_super_admin_role

  
  attr_writer :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, authentication_keys: [:login]

  def login
    @login || self.username || self.email
  end       
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) ILIKE '%#{login.downcase}%' OR lower(email) = :value",
                                       { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

  def assign_super_admin_role
    self.add_role(:super_admin) if Admin.count == 1
  end
  
  
  protected

  def confirmation_required?
    false
  end
end
