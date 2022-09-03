class AddColumnToReceiving < ActiveRecord::Migration[6.1]
  def up
    add_column :receivings, :amount_received, :integer, default: 0
  end
  
  def down
    remove_column :receivings, :amount_received
  end
end
