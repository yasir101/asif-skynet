class AddColumnOfPackageInCustomer < ActiveRecord::Migration[6.1]
  def up
    add_reference :customers, :package, index: true
  end
end
