class ChatsController < ApplicationController
    before_action : authenticate_usuario
    include JsonFormat
    include Funciones

    def index
        if current_usuario.rol.rango == 3 || current_usuario.rol.rango == 4
            chats = Chats.all
            render json: chats.as_json(json_data)
        end
    end

end