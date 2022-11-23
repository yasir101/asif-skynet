class AddStatusColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :status, :boolean, default: true
  end
end
