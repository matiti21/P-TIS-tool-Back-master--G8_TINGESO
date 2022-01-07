class SeccionesController < ApplicationController
  before_action :authenticate_usuario
  #before_action :usuario_actual, only: [:index, :sin_grupo]
  include JsonFormat

  # Servicio que entrega las secciones asignadas a un profesor para el semestre activo
  def index
    semestre_actual = Semestre.where('activo = ? AND borrado = ?', true, false).last
    usuario = Usuario.find(current_usuario.id)
    if usuario.rol.rango == 1
      secciones = Seccion.where('semestre_id = ? AND borrado = ?', semestre_actual.id, false)
    elsif usuario.rol.rango == 2
      secciones = Seccion.joins(:profesores).where('profesores.usuario_id = ? AND semestre_id = ? AND borrado = ?', usuario.id, semestre_actual.id, false)
    end
    render json: secciones.as_json(
      {except: %i[jornada_id semestre_id curso_id borrado deleted_at created_at updated_at],
        :include => {
          :curso => json_data,
          :jornada => json_data,
          :semestre => json_data
        }
      }
    )
  end
  # Servicio que permite agregar una nueva seccion al sistema
  def create
    seccion = Seccion.new(seccion_params)
    if seccion.valid?
      seccion.save!
    else
      render json: ['error': 'Información de sección no es válida'], status: :unprocessable_entity
    end
  end
  # Servicio que permite eliminar estudiantes del sistema mediante borrado lógico
  def eliminar
    if params[:eliminados].size > 0
      seccion = Seccion.where(id: params[:eliminados])
      seccion.each do |s|
        s.borrado = true
        s.deleted_at = Time.now()
        s.save
      end
    end
  end
  #Servicio que entrega todas las secciones
  def mostrar_secciones
    usuario = Usuario.find(current_usuario.id)
    if(usuario.rol.rango == 1 || usuario.rol.rango == 2)
      secciones = Seccion.all
    end
    render json: secciones.as_json(
      {except: %i[jornada_id semestre_id curso_id borrado deleted_at created_at updated_at],
        :include => {
          :curso => json_data,
          :jornada => json_data,
          :semestre => json_data
        }
      }
    )
  end
  #Servicio que entrega todas las secciones asignadas a un profesor
  def mostrar_secciones_asignadas
    usuario = Usuario.find(current_usuario.id)
    if usuario.rol.rango == 2
      secciones = Seccion.joins(:profesores).where('profesores.usuario_id = ? AND borrado = ?', usuario.id, false)
    end
    render json: secciones.as_json(
      {except: %i[jornada_id semestre_id curso_id borrado deleted_at created_at updated_at],
        :include => {
          :curso => json_data,
          :jornada => json_data,
          :semestre => json_data
        }
      }
    )
  end
  # Servicio que entrega las secciones asignadas a un profesor para el semestre activo y segun la jornada
  def por_jornada()
    semestre_actual = Semestre.where('activo = ? AND borrado = ?', true, false).last
    usuario = Usuario.find(current_usuario.id)
    if usuario.rol.rango == 1
      secciones = Seccion.where('semestre_id = ? AND jornada_id = ? AND borrado = ?', semestre_actual.id, params[:idJornada], false)
    elsif usuario.rol.rango == 2
      secciones = Seccion.joins(:profesores).where('profesores.usuario_id = ? AND semestre_id = ? AND jornada_id = ? AND borrado = ?', usuario.id, semestre_actual.id, params[:idJornada], false)
    end
    render json: secciones.as_json(json_data)
  end

   #Servicio que entrega los estudiantes de una seccion
  def estudiantes_de_seccion
    usuario = Usuario.find(current_usuario.id)
    if(usuario.rol.rango ==2)
      estudiantes = Estudiante.joins(:usuario).where(
        'seccion_id = ? AND usuarios.borrado = ?', params[:id], false).select(
          'estudiantes.id,
          usuarios.run AS run_est,
          usuarios.nombre AS nombre_est,
          usuarios.apellido_paterno AS apellido1,
          usuarios.apellido_materno AS apellido2,
          usuarios.email AS correo'
        )
    end
    render json: estudiantes.as_json(json_data)
  end

  #Servicio que entrega los estudiantes del semestre actual y de la misma jornada que la seccion recibida
  def estudiantes_de_jornada
    usuario = Usuario.find(current_usuario.id)
    semestre_actual = Semestre.where('activo = ? AND borrado = ?', true, false).last
    if usuario.rol.rango == 2
      estudiantes = Estudiante.joins(:usuario).joins(seccion: :jornada).joins(seccion: :semestre).where(
        'semestres.id = ? AND usuarios.borrado = ? AND jornadas.nombre = ?', semestre_actual.id, false, params[:nombre]).select(
          'estudiantes.id,
          estudiantes.seccion_id,
          usuarios.run AS run_est,
          usuarios.nombre AS nombre_est,
          usuarios.apellido_paterno AS apellido1,
          usuarios.apellido_materno AS apellido2,
          usuarios.email AS correo,
          secciones.codigo AS codigo_seccion,
          jornadas.nombre AS jornada
          '
        )
    end
    render json: estudiantes.as_json(json_data)
  end

  private
  def seccion_params
    params.require(:seccion).permit(:codigo, :jornada_id, :semestre_id, :curso_id)
  end
end
