class RemoveColumnsFormPackages < ActiveRecord::Migration[6.1]
  def up
    remove_column :packages, :company_id
    remove_column :packages, :company_package_id
  end
  
  def down
    add_reference :packages, :company
    add_reference :packages, :company

  end
end
