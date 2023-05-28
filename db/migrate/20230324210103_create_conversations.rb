class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :uuid
      t.string :name

      t.timestamps
    end
  end
end
