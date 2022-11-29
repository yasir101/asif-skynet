class AddColumnInReceivngsToCheckStatus < ActiveRecord::Migration[6.1]
  def up
    add_column :receivings, :status, :boolean, default: false
  end
end
