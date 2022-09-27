class AddCompanyIdToCustomer < ActiveRecord::Migration[6.1]
  def up
    add_reference :customers, :company, index: true
  end
end
