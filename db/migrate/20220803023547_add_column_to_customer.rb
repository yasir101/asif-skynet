class AddColumnToCustomer < ActiveRecord::Migration[6.1]
  def up
    add_column :customers, :promise_break_count, :integer, default: 0
  end
  
  def down
    remove_column :customers, :promise_break_count
  end
end
