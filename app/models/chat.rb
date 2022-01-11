class Chat < ApplicationRecord
    belongs_to :grupo
    has_many :mensaje
    validates :grupo, uniqueness: true

end