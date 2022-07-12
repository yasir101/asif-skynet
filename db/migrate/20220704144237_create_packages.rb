class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
      t.integer :company_id
      t.references :company_package
      t.string :name
      t.integer :price 
      t.timestamps
    end
  end
end
