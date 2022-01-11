class ChatsController < ApplicationController
    before_action :authenticate_usuario
    include JsonFormat


    def index
        if current_usuario.rol.rango == 3 || current_usuario.rol.rango == 4
            chats = Chats.all
            render json: chats.as_json(json_data)
        end
    end

    #Sistema que entrega el chat actual
    def show
        if current_usuario.rol.rango == 3 || current_usuario.rol.rango == 4
            chat = Chat.where('grupo_id = ?', params[:id])
        else
            render json: ['Error': 'Información del chat no obtenida'], status: :unprocessable_entity
        end
        render json: chat.as_json(json_data)
    end

    
    # Servicio que crea un chat nuevo en el sistema con el grupo entregado
    def crear_chat_grupo
        if current_usuario.rol.rango == 3 || current_usuario.rol.rango == 4
            chat = Chat.new
            chat.grupo_id = params[:grupo_id]
            if chat.valid?
                chat.save!
            else
                render json: ['error': 'Información del chat no es válida'], status: :unprocessable_entity
            end
        end
    end

    private 
    def chat_params
        params.require(:chat).permit(:grupo_id)
    end


        

end