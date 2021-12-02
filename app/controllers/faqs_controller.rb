class FaqsController < ApplicationController
  before_action :authenticate_usuario
  include JsonFormat
  include Funciones

  def index
    faqs = Faqs.all

    render json: faqs.as_json(json_data)

  end

  def by_rol
    faqs = Faqs.where(
      'rol_id = ?', @usuario.rol_id)
    render json: faqs.as_json(json_data)
  end

  def profesor
    faqs = Faqs.where(
      'rol_id = ? AND section = ?', @usuario.rol_id, params[:section])
    render json: faqs.as_json(json_data)
  end

end

