class Customer < ApplicationRecord  
  belongs_to :service, optional: true
  belongs_to :company, optional: true
  belongs_to :purchase_package, optional: true
  belongs_to :package, optional: true
  belongs_to :country, optional: true
  belongs_to :city, optional: true
  belongs_to :area, optional: true
  belongs_to :sub_area, optional: true  
  belongs_to :staff, optional: true  
  
  
  def get_package_price
    self.package_discounted_price.nil? ? self.package.price : self.package_discounted_price
  end
end
