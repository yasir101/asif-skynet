class AddColumnIn < ActiveRecord::Migration[6.1]
  def up
    add_reference :customers, :purchase_package, index: true
  end
end
