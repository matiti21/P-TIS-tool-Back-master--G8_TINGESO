class EstudiantesMailer < ApplicationMailer
  def nuevaMinutaCoordinacion(bitacora)
    @bitacora = bitacora
    @emisor = bitacora.minuta.estudiante
    emails = obtener_correos_estudiantes(bitacora)
    mail(to: emails, subject: "Hay una nueva minuta de reunión que requiere tu revisión", template_name: 'nueva_minuta_coordinacion')
  end
  def revisionProfesorCliente(bitacora)
    @bitacora = bitacora
    @emisor = bitacora.minuta.estudiante
    @grupo = @emisor.grupo
    emails = obtener_correos_profesores(bitacora)
    mail(to: emails, subject: "Hay una nueva minuta de reunión con el cliente que requiere tu revisión", template_name: 'minuta_revision_profesor')
  end
  def revisionProfesor(bitacora)
    @bitacora = bitacora
    @emisor = bitacora.minuta.estudiante
    @grupo = @emisor.grupo
    emails = obtener_correos_profesores(bitacora)
    mail(to: emails, subject: "Hay una nueva minuta de reunión de coordinación interna que requiere tu revisión", template_name: 'minutaInterna_revision_profesor')
  end
  def revisionCliente(bitacora)
    @bitacora = bitacora
    @emisor = bitacora.minuta.estudiante
    @grupo = @emisor.grupo
    emails = obtener_correos_stakeholders(bitacora)
    mail(to: emails, subject: "Se ha emitido una nueva minuta para su revisión", template_name: 'minuta_revision_cliente')
  end

  def avisoAestudiantes(bitacora)
    @bitacora = bitacora
    @emisor = bitacora.minuta.estudiante
    emails = obtener_correos_estudiantes(bitacora)
    mail(to: emails, subject: "Se ha emitido una minuta para revisión del cliente", template_name: 'aviso_a_estudiantes')
  end
  def avisoAestudiantesEmision(bitacora)
    @bitacora = bitacora
    emails = obtener_correos_estudiantes(bitacora)
    mail(to: emails, subject: "Se ha emitido una minuta de coordinación interna", template_name: 'minutaInterna_revision_estudiantes')
  end
  def avisoAestudiantesEmision(bitacora)
    @bitacora = bitacora
    @emisor = bitacora.minuta.estudiante
    emails = obtener_correos_estudiantes(bitacora)
    mail(to: emails, subject: "Se ha emitido una minuta de coordinación interna", template_name: 'minutaInterna_revision_estudiantes')
  end
  def respuestaAlCliente(bitacora)
    @bitacora = bitacora
    @emisor = bitacora.minuta.estudiante
    @grupo = @emisor.grupo
    emails = obtener_correos_stakeholders(bitacora)
    mail(to: emails, subject: "Se han respondido los comentarios realizados a la minuta #{@bitacora.minuta.codigo}_#{@bitacora.revision}", template_name: 'respuestas_a_comentarios')
  end

  private
  def obtener_correos_estudiantes(bitacora)
    asistencias = bitacora.minuta.asistencias.where.not(id_estudiante: nil)
    lista_ids = []
    asistencias.each do |a|
      unless a.id_estudiante == bitacora.minuta.estudiante_id
        lista_ids << a.id_estudiante
      end
    end
    estudiantes = Estudiante.joins(:usuario).where(id: lista_ids).select('usuarios.email AS correo')
    emails = estudiantes.collect(&:correo).join(', ')
    return emails
  end

  def obtener_correos_stakeholders(bitacora)
    asistencias = bitacora.minuta.asistencias.where.not(id_stakeholder: nil)
    lista_ids = []
    asistencias.each do |a|
      lista_ids << a.id_stakeholder
    end
    stakeholders = Stakeholder.joins(:usuario).where(id: lista_ids).select('usuarios.email AS correo')
    return stakeholders.collect(&:correo).join(', ')
  end
  def obtener_correos_profesores(bitacora)
    asistencias = bitacora.minuta.asistencias.where.not(id_estudiante: nil)
    lista_ids = []
    asistencias.each do |a|
      unless a.id_estudiante == bitacora.minuta.estudiante_id
        lista_ids << a.id_estudiante
      end
    end
    idEstudiante=lista_ids[0]
    estudiante=Estudiante.find(idEstudiante)
    idSeccion=estudiante.seccion_id
    seccion=Seccion.find(idSeccion)
    listaIdProfesores= []
    seccion.profesores.each do |e|
      listaIdProfesores << e.id
    end
    profesores = Profesor.joins(:usuario).where(id: listaIdProfesores).select('usuarios.email AS correo')
    emails = profesores.collect(&:correo).join(', ')
    return emails
  end
end

