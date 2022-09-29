class CreatePurchasePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_packages do |t|
      t.references :company
      t.string :package_name
      t.integer :purchase_price
      t.timestamps
    end
  end
end
