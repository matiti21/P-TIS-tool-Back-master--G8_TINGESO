class MensajesController < ApplicationController
    before_action : authenticate_usuario

    include JsonFormat
    include Funciones
    
    def index


end