FactoryBot.define do
    seccion2 = Seccion.find(1)
    usuario2 = Usuario.all
    factory :estudiante do
        iniciales { 'OAD' }
        usuario { usuario2 }
        seccion { seccion2 }
        grupo_id  { 2 }

    end
end