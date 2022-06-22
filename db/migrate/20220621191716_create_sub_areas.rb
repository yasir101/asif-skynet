class CreateSubAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_areas do |t|
      t.string :name
      t.references :area
      t.timestamps
    end
  end
end
