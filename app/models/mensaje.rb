class Mensaje < ApplicationRecord
    belongs_to: chat
    belongs_to: usuario

    def tiempo_mensaje
        created.at.strftime("%d%m%y a las %l:%M %p")
    end
end