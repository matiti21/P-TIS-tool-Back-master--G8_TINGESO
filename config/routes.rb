Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :usuarios, only: [:index]
  resources :secciones, only: [:index, :create]
  get 'profesor/secciones/mostrar_secciones', to: 'secciones#mostrar_secciones_asignadas'
  get 'profesor/secciones/mostrar_secciones/:id', to: 'secciones#estudiantes_de_seccion'
  get 'profesor/secciones/estudiantes_jornada/:nombre', to: 'secciones#estudiantes_de_jornada'
  get 'secciones/:idJornada', to: 'secciones#por_jornada'
  post 'secciones/eliminar', to: 'secciones#eliminar'
  resources :estudiantes, only: [:index, :create, :show, :update]
  get 'estudiantes/asignacion/sin_grupo', to: 'estudiantes#sin_grupo'
  post 'estudiantes/eliminar', to: 'estudiantes#eliminar'
  post 'estudiantes/archivo/nuevos', to: 'estudiantes#desde_archivo'
  get 'estudiantes/archivo/plantilla', to: 'estudiantes#plantilla'


  resources :stakeholders, except: [:destroy, :new, :edit]
  get 'stakeholders/asignacion/grupos', to: 'stakeholders#por_jornada'

  resources :profesores, only: [:index, :create, :update]

  resources :grupos, except: [:new, :edit]
  post 'grupos/ultimo_grupo', to: 'grupos#ultimo_grupo'
  put 'grupos/asignacion/stakeholders/:id', to: 'grupos#cambiar_asignacion'
  get 'estudiante/chat', to: 'grupos#grupo_actual'

  resources :jornadas, only: [:index]
  get 'jornadas/sin_repetir', to: 'jornadas#sin_repetir'
  resources :cursos, only: [:index]
  resources :tipo_minutas, only: [:index]
  resources :tipo_asistencias, only: [:index]
  resources :tipo_items, only: [:index]
  resources :tipo_estados, only: [:index]
  resources :motivos, only: [:index]
  resources :semestres, only: [:index]
  resources :minutas, only: [:create, :show, :update]
  resources :faqs, only: [:index]
  get 'faqs/rol', to: 'faqs#by_rol'
  get 'faqs/profesor/:section', to: 'faqs#profesor'
  get 'minutas/correlativo/:id', to: 'minutas#correlativo'
  get 'minutas/grupo/:id', to: 'minutas#por_grupo'
  get 'minutas/revision/estados', to: 'minutas#por_estados'
  get 'minutas/revision/grupo', to: 'minutas#revision_grupo'
  get 'minutas/revision/cliente/:id', to: 'minutas#revision_cliente'
  get 'minutas/revision/respondidas', to: 'minutas#por_respuestas'
  post 'minutas/avance/semanal', to: 'minutas#crear_avance'
  get 'minutas/correlativo/semanal/:id', to: 'minutas#correlativo_semanal'
  get 'minutas/avances/semanales/grupo/:id', to: 'minutas#avances_por_grupo'
  post 'minutas/actualizar/avance/semanal', to: 'minutas#actualizar_avance'
  get 'verificar/:id', to: 'minutas#verificarAprobaciones'
  resources :comentarios, only: [:create, :show]
  resources :tipo_aprobaciones, only: [:index]
  resources :respuestas, only: [:create, :show]
  resources :aprobaciones, only: [:show, :update]
  resources :registros, only: [:show]
  get 'registros/grupo/:grupo', to: 'registros#actividades_minutas'

  resources :usuarios, only: [:update]
  get 'login/user', to: 'usuarios#user'

  scope 'auth' do
    post 'login' => 'usuarios#login'
  end

end
