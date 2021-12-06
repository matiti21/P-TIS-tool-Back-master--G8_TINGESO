class Faqs < ApplicationRecord
  belongs_to :rol

  # Validaciones
  validates :pregunta,:respuesta, presence: true

end
