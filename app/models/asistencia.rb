class Asistencia < ApplicationRecord
  belongs_to :minuta
  belongs_to :tipo_asistencia
  has_many :comentarios
  has_many :respuestas
  has_many :aprobaciones
  has_one :responsable

  # Validaciones
  validates :id_estudiante, presence: true, if: :is_estudiante?
  validates :id_stakeholder, presence: true, if: :is_stakeholder?
  validates :profesor_id, presence: true, if: :is_profesor?
  validates :id_estudiante, :id_stakeholder, :profesor_id, numericality: {only_integer: true, greater_than: 0}, allow_nil: true

  def id_stakeholder_nil?
    self.id_stakeholder.nil?
  end

  def id_estudiante_nil?
    self.id_estudiante.nil?
  end

  def id_profesor_nil?
    self.profesor_id.nil?
  end

  def is_estudiante?
    return self.id_stakeholder.nil? && self.profesor_id.nil?
  end

  def is_stakeholder?
    return self.id_estudiante.nil? && self.profesor_id.nil?
  end

  def is_profesor?
    return self.id_estudiante.nil? && self.id_stakeholder.nil?
  end

end
