class AddColumnToReceivings < ActiveRecord::Migration[6.1]
  def up
    add_column :receivings, :discount, :integer, default: 0
  end
  
  def down
    remove_column :receivings, :discount
  end
end
