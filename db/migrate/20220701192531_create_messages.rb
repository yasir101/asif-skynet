class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :message_template
      t.string :number
      t.text :message_text
      t.timestamps
    end
  end
end
