class CreateFaqs < ActiveRecord::Migration[6.0]
  def change
    create_table "faqs", force: :cascade do |t|
      t.string :pregunta
      t.string :respuesta
      t.references :rol, null: false, foreign_key: true
      t.timestamps
    end
  end
end
