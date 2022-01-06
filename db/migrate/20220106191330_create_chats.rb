class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.integer : grupo_id
      t.timestamps
    end
  end
end
