class CreateCompanyPackages < ActiveRecord::Migration[6.1]
  def change
    create_table :company_packages do |t|
      t.references :company
      t.string :name
      t.integer :price
      t.timestamps
    end
  end
end
