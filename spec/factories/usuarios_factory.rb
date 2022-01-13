FactoryBot.define do
    factory :usuario do
        roles = Rol.all
        nombre { 'Matias' }
        apellido_paterno { 'Pizarro' }
        apellido_materno { 'Flores' } 
        run {  '19700195-K' }
        email {  'matias.pizarro@usach.cl' }
        password {'secret'}
        rol {roles.find_by(rango: 3)}
    end
end