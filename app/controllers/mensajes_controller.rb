class MensajesController < ApplicationController
    before_action :authenticate_usuario

    include JsonFormat
    include Funciones
    
    #Servicio que entrega todos los mensajes del sistema
    def index
        mensajes = Mensajes.all
        render json: mensajes.as_json(json_data)
    end

    #Servicio que entrega todos los mensajes de un chat
    def show
        if current_usuario.rol.rango == 3 || current_usuario.rol.rango == 4
            mensajes = Mensaje.joins(:chat).where('chats.grupo_id = ?', params[:id]).select('
            mensajes.id,
            mensajes.texto,
            mensajes.usuario_id,
            mensajes.created_at AS fecha')
        else
            render json: ['Error': 'Información del chat no obtenida'], status: :unprocessable_entity
        end
        render json: mensajes.as_json(json_data)
    end

    #Servicio que crea un mensaje nuevo en el chat
    def create
        if current_usuario.rol.rango == 3 || current_usuario.rol.rango == 4
            mensaje = Mensaje.new
            mensaje.texto = params[:texto]
            mensaje.usuario_id = params[:usuario_id]
            mensaje.chat_id = params[:chat_id]
            if mensaje.valid?
                mensaje.save!
            else
                render json: ['error': 'Información del mensaje no es válida'], status: :unprocessable_entity
            end
        end
    end

    private
    def mensaje_params
        params.require(:mensaje).permit(:chat_id, :texto, :usuario_id)
    end





end