class Seccion < ApplicationRecord
  belongs_to :jornada
  belongs_to :semestre
  belongs_to :curso
  has_and_belongs_to_many :profesores
  has_many :estudiantes

  # validaciones
  validates :codigo, presence: true
  validates :jornada_id, numericality: {only_integer: true, greater_than: 0}, presence: true
  validates :semestre_id, numericality: {only_integer: true, greater_than: 0}, presence: true
  validates :curso_id, numericality: {only_integer: true, greater_than: 0}, presence: true
end
