class ProfesorMailer < ApplicationMailer

  def comentariosMinuta(bitacora, usuario)
    @bitacora = bitacora
    @usuario = usuario
    @estudiante = bitacora.minuta.estudiante
    mail(to: @estudiante.usuario.email, subject: "Se ha realizado la revisión de una minuta de avance", template_name: 'comentarios_profesor')
  end

end
