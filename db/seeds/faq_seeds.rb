roles = Rol.all

Faqs.create([
    { "pregunta" => "Finalidad de la herramienta",
      "respuesta" => "Esta aplicación permite la creación de minutas de reunión de grupo, con o sin el cliente, y la creación de minutas de avance semanal.",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "¿Qué es una minuta de coordinación?",
      "respuesta" => "Corresponden a las minutas creadas tras las reuniones de los integrantes del grupo de trabajo.",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "¿Que es una minuta de reunión con el cliente?",
      "respuesta" => "Las minutas de reunión con el cliente, permiten registrar los acuerdos y los temas tratados con el cliente del proyecto. Se diferencian con las minutas de coordinación por el registro de asistencia de cada una de ellas y por las fases de revisión que cada una tiene.",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "¿Que es una minuta semanal?",
      "respuesta" => "Es la actividad en la cual se deja constancia del trabajo de la semana que termina, los logros y compromisos para la semana entrante",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "¿Cómo crear una minuta?",
      "respuesta" => "Se debe dar click en el botón de Nueva minuta, se desplegará un selector en el que elige el tipo de minuta a realizar y da click en el botón de elegir",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "Etapas de revisión de minutas.",
      "respuesta" => "Esto depende del tipo de minuta que se emita:<br><br>Para la minuta de coordinación debe pasar por una revisión de todos los miembros del grupo para la emisión definitiva.<br><br>En el caso de las minutas de reunión con el cliente esta debe pasar por una revisión del equipo y después por la del cliente.",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "Revisión de minutas emitidas.",
      "respuesta" => "Una vez que un integrante del grupo ha emitido una minuta de reunión, esta se presentará en la sección <b>Para revisar</b> del resto de los integrantes del grupo. <br><br> Al seleccionar una minuta de la sección <b>Para revisar</b>, se presenta la minuta con la opción de poder comentar los ítems y agregar comentarios generales. <br><br> Al presionar en <b>comentar</b> que se encuentra al costado derecho de cada ítem de la minuta, se presenta un cuadro de texto para escribir el comentario a añadir. A su vez, para agregar comentarios adicionales a los ítems de la minuta, al presionar el botón <b>Agregar comentario</b>, se presentará un cuadro de ingreso del nuevo comentario. Finalmente se deben guardar los comentarios y definir un estado de revisión.",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "Revisión de comentarios de minutas de reunión",
      "respuesta" => "Las respuestas a los comentarios realizados por los integrantes del grupo pueden ser revisadas en la sección <b>Respondidas</b> de la vista inicial del estudiante.<br><br> Al seleccionar una minuta de esta sección, se presenta la minuta con los comentarios y las respuestas a los comentarios realizados. El integrante del grupo, que revisa estas respuestas, tiene la opción de aprobar la minuta o rechazarla según las respuestas a los comentarios realizados.<br><br> Tras la elección del estado de aprobación de la minuta, una vez que todos los integrantes del grupo han concluido su revisión de las respuestas a los comentarios, la minuta concluye su etapa de revisión quedando registrada en la sección <b>Cerradas</b> de la vista inicial de estudiantes.",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "Emitir nueva minuta de reunión",
      "respuesta" => "Para emitir una nueva versión de una minuta cerrada tras su revisión por parte de los integrantes del grupo, se debe seleccionar la minuta desde la vista de minutas <b>Cerradas</b> y seleccionar <b>Emitir nueva versión</b>. Se volverá a abrir el formulario de creación de minuta con la información de la minuta en su versión anterior para su modificación y nueva emisión.",
      "rol" => roles.find_by(rango: 3)
    },
    { "pregunta" => "Incorporar a un nuevo estudiante.",
      "respuesta" => "Primero se debe presionar el botón Agregar estudiante, tras lo cual se despliega el formulario que permite ingresar un nuevo estudiante. En dicho formulario se debe ingresar: <ul><li>R.U.N.</li><li>Nombre del estudiante</li><li>Apellido paterno del estudiante</li><li>Apellido materno del estudiante</li><li>Correo electrónico corporativo del estudiante</li><li>Jornada en la que participa el estudiante</li></ul><br> Una vez ingresados los datos se presiona el botón Agregar. En caso de cancelar esta opción, dar click en el botón Cancelar.",
      "section" => "estudiante",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Incorporar estudiantes desde un archivo.",
      "respuesta" => "Para incorporar estudiantes desde un archivo, se debe presionar el botón <b>Subir nómina</b> que se presenta en la vista inicial del profesor, con esto se abre el formulario de ingreso de nómina de estudiantes.<br><br>En este formulario se debe indicar la jornada a la cual pertenecerán los estudiantes que se van a incorporar y subir el archivo con la nómina de estudiantes a cargar. Para conocer el formato de la nómina a subir, presionando el botón <b>Descargar formato plantilla</b> se entrega un archivo del tipo Excel con el formato requerido para subir la nómina.<br><br>Una vez subida la nómina de estudiantes y la asignación de la jornada para estos estudiantes. Presionando el botón <b>Cargar</b>, se incorporan los datos de los estudiantes al sistema y estos son agregados al listado de estudiantes.",
      "section" => "estudiante",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Ingreso al sistema de un nuevo estudiante.",
      "respuesta" => "El nuevo estudiante podrá ingresar a la aplicación mediante la dirección de correo electrónico ingresada durante su registro, con la clave de acceso con el formato <b>Nombre_del_estudiante123</b>.",
      "section" => "estudiante",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Editar estudiante.",
      "respuesta" => "Para editar un estudiante del sistema, es necesario seleccionar un estudiante del listado de estudiantes, se despliega el formulario con los datos del estudiante para su modificación. En este formulario se pueden cambiar todos los datos del estudiante a excepción del R.U.N. Una vez actualizados los datos del estudiante, al presionar el botón <b>Actualizar</b> se cambian estos datos y se verá reflejado en el listado de estudiantes de esta sección.",
      "section" => "estudiante",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Eliminar estudiantes.",
      "respuesta" => "Para eliminar estudiantes del sistema, se deben seleccionar los estudiantes del listado presentado, esto se hace haciendo click en el checkbox que se encuentra en la última columna de la tabla. Al seleccionar uno de ellos, se presenta un botón al término de la lista que permite borrar el o los estudiantes del sistema. Al presionar el botón <b>Eliminar</b> se presenta un mensaje de confirmación para ratificar la acción. En este mensaje se indica la cantidad de estudiantes a eliminar y se solicita volver a confirmar la acción con el botón <b>Aceptar</b>. En caso de presionar el botón <b>Cancelar</b> se anula la acción y el estudiante se mantiene en el sistema.",
      "section" => "estudiante",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Crear grupo.",
      "respuesta" => "Para agregar un nuevo grupo, se debe seleccionar el botón <b>Agregar Grupo</b> con lo cual se mostrará el formulario de creación de grupo. En dicho formulario se permite ingresar el nombre del grupo y seleccionar los estudiantes que formarán parte del grupo. El listado de estudiantes mostrado al costado derecho del formulario, corresponden a aquellos estudiantes que no cuentan con la asignación a un grupo de trabajo. El número de grupo se determina de forma automática. Una vez ingresado los datos del grupo, al presionar el botón <b>Crear grupo</b> se genera el nuevo grupo de trabajo y se mostrará en la pantalla inicial junto a los otros grupos de trabajo.",
      "section" => "grupos",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Editar Grupo.",
      "respuesta" => "Para editar la información de un grupo, se debe presionar el botón <b>Editar</b> ubicado en la parte central superior del grupo en la vista <b>Grupos</b>. Cuando se selecciona la opción de editar un grupo se abre el formulario de creación de grupo con los datos cargados anteriormente, siendo posible cambiar el nombre del grupo y la asignación de estudiantes. Para hacer efectiva la edición se debe presionar el botón <b>Actualizar grupo</b>, en caso de retractarse de la modificación hacer click en <b>Cancelar</b>.",
      "section" => "grupos",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Eliminar Grupo.",
      "respuesta" => "Para eliminar un grupo de trabajo, se debe seleccionar la vista <b>Grupos</b> y pinchar en el icono marcado con una ‘X’ en la parte superior derecha del grupo. Al solicitar la eliminación de un grupo de trabajo, se le solicitará confirmar la acción. Al presionar <b>Aceptar</b> se eliminará el grupo y los estudiantes quedarán libres para poder ser asignados nuevamente a un grupo. El cliente asignado, quedará liberado de esta asignación.",
      "section" => "grupos",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Agregar cliente.",
      "respuesta" => "Para llevar a cabo esta acción se debe presionar el botón <b>Agregar Cliente</b>. Se presentará el formulario de ingreso de datos del cliente que incluye: <ul><li>Nombre del cliente</li><li>Apellido paterno del cliente</li><li>Apellido materno del cliente</li><li>Correo electrónico</li><li>Grupo de trabajo que se asigna</li></ul><br>",
      "section" => "clientes",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Editar datos de cliente.",
      "respuesta" => "Primero se debe seleccionar al cliente que se desea modificar de la lista de clientes que se aprecia. Una vez hecho lo anterior se presenta el formulario de creación de clientes con sus datos y la posibilidad de ser modificados. Una vez modificados los datos del cliente, al presionar en el botón <b>Actualizar</b> se guardarán los cambios y se presentarán en el listado de clientes de esta sección.",
      "section" => "clientes",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Editar asignación de cliente a grupo.",
      "respuesta" => "Se debe pulsar el botón Editar asignaciones, se mostrará la lista de los grupos donde se debe elegir uno de ellos para mostrar los clientes asignados. Marcándolos en los recuadros a la derecha de sus nombres, se pueden definir los clientes a asignar al grupo de trabajo elegido. Al seleccionar el botón <b>Asignar</b> se guardará la nueva asignación de clientes al grupo. Por otro lado, para quitar la asignación de un cliente a un grupo de trabajo se debe quitar la selección del checkbox de la derecha y guardar con el botón <b>Asignar</b>.",
      "section" => "clientes",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Selección de minuta a revisar.",
      "respuesta" => "Primero se debe seleccionar el grupo del cual se revisarán las minutas de reunión. Una vez seleccionado el grupo a revisar, se muestra al costado derecho los alumnos que componen el grupo. En la parte inferior se muestran las distintas minutas de reunión emitidas. Para revisar cualquiera de las minutas se debe hacer click en la que desee, luego se muestra por pantalla la minuta seleccionada. Al costado derecho se muestra un recuadro con todas las versiones anteriores de la minuta seleccionada.",
      "section" => "minutas",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Desplegar registro de actividades de una minuta.",
      "respuesta" => "Para ver el registro de actividades se debe ir al final de la minuta que se está revisando  y pulsar el botón <b>Ver registro</b>. Se presenta el listado de actividades realizadas en la minuta, indicando la fecha de realización, hora de realización y quién la realizó.",
      "section" => "minutas",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Selección de minuta a revisar.",
      "respuesta" => "Para revisar minutas de avance semanal, se debe seleccionar la opción <b>Revisar Avances</b> del menú superior.Tras seleccionar esta opción, se presenta un selector de grupo que permite elegir el grupo a revisar.",
      "section" => "avances",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Finalidad de la herramienta.",
      "respuesta" => "Esta aplicación permite la revisión de las minutas de reunión que usted ha tenido con el o los equipos de desarrollo del que usted es cliente.",
      "rol" => roles.find_by(rango: 4)
    },
    { "pregunta" => "Revisión de minutas de reunión.",
      "respuesta" => "En caso de tener más de un grupo asignado se hace necesario primero escoger un grupo para la revisión. Una vez hecho lo anterior hay que proceder a la sección 'Para revisar' del tablero de minutas del grupo seleccionado. Se desplegará la minuta con la opción de poder comentar los ítems y agregar comentarios generales.<br><br>Al presionar en la palabra <b>comentar</b> que se encuentra al costado derecho de cada ítem de la minuta, se presentará un cuadro de texto para escribir el comentario a añadir. A su vez, para agregar comentarios adicionales a los ítems de la minuta, al presionar el botón <b>Agregar comentario</b> se presentará un cuadro de ingreso del nuevo comentario. Finalmente deberá presionar el botón <b>Guardar comentarios</b> donde también deberá elegir el estado de revisión que sea más acorde a lo que observó en la revisión.",
      "rol" => roles.find_by(rango: 4)
    },
    { "pregunta" => "Revisión de las respuestas a los comentarios realizados.",
      "respuesta" => "Las respuestas de los integrantes del grupo a los comentarios realizados pueden ser revisadas en la sección <b>Respondidas</b> de la vista inicial del cliente. Al seleccionar una minuta de esta sección, se presenta la minuta con los comentarios y las respuestas a los comentarios realizados. Se presenta la opción de aprobar la minuta o rechazarla según las respuestas a los comentarios realizados.<br><br>Tras la elección del estado de aprobación de la minuta, una vez que todos los clientes del grupo han concluido su revisión de las respuestas a los comentarios, la minuta concluye su etapa de revisión quedando registrada en la sección <b>Cerradas</b>.",
      "rol" => roles.find_by(rango: 4)
    },
    { "pregunta" => "Vista secciones.",
      "respuesta" => "Se muestran todas las secciones, ya sean del semestre actual o de uno pasado para el profesor. Pulsando en el botón <b>Editar</b> se podrá acceder al menú de edición de la sección por parte del profesor.",
      "section" => "secciones",
      "rol" => roles.find_by(rango: 2)
    },
    { "pregunta" => "Asignación de estudiantes a una sección.",
      "respuesta" => "En la vista de secciones apretar el botón <b>Editar</b> de la sección que se quiera editar. Una vez dentro se observa la lista de los estudiantes que actualmente se encuentran en la sección. Si se desea ingresar un nuevo estudiante, oprimir el botón <b>Asignar estudiante</b>, se mostrará una lista con todos los estudiantes posibles de asignar a la sección, se seleccionan haciendo click en el checkbox y una vez teniendo lista la selección, para confirmar los cambios se debe pulsar el botón <b>Actualizar</b>. Para desechar los cambios pulsar <b>Cancelar</b>.",
      "section" => "secciones",
      "rol" => roles.find_by(rango: 2)
    }
  ])

