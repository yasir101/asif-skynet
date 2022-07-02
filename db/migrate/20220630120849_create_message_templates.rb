class CreateMessageTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :message_templates do |t|
      t.string :title
      t.text :message
      t.timestamps
    end
  end
end
