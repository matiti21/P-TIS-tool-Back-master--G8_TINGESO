class CursosController < ApplicationController
    before_action :authenticate_usuario
    include JsonFormat
  
    # Servicio que entrega las jornadas de estudio según secciones asociadas a un profesor o al Coordinador
    def index
      cursos = Curso.where('borrado = ?', false)
      render json: cursos.as_json(json_data)
    end
end