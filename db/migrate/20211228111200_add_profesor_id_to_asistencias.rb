class AddProfesorIdToAsistencias < ActiveRecord::Migration[6.0]
  def change
    add_column :asistencias, :profesor_id, :bigint
  end
end
