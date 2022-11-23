class RemoveColumnStatusFromSubscriptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscriptions, :status
  end
end
