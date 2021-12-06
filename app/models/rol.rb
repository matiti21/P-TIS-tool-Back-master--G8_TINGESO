class Rol < ApplicationRecord
  has_many :usuarios
  has_one :faq

  # validaciones
  validates :rango, uniqueness: true
end
