class FaqsController < ApplicationController
  #before_action :authenticate_usuario
  include JsonFormat
  include Funciones

  def index
    faqs = Faqs.all

    render json: faqs.as_json(json_data)

  end

  def usuario
    faqs = Faqs.find_by(rol_id: params[:id])

    render json: faqs.as_json(json_data)

  end

end

