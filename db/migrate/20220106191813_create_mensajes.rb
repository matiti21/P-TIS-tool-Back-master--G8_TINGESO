class CreateMensajes < ActiveRecord::Migration[6.0]
  def change
    create_table :mensajes do |t|
      t.text :texto 
      t.references :chat, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true
      t.timestamps
    end
  end
end
