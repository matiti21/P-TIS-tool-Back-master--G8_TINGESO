class AddSectionToFaqs < ActiveRecord::Migration[6.0]
  def change
    add_column :faqs, :section, :string
  end
end
