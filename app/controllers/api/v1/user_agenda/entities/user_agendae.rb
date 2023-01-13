module Api
    module V1
        module UserAgenda
            module Entities
                class UserAgendae < Grape::Entity
                    root 'user_agenda', 'user_agenda'
                    expose :id
                    expose :email
                    expose :username
                    expose :registered_at
                    expose :created_at
                    expose :agenda, using: Api::V1::UserAgenda::Entities::Agendae
                end
            end
        end
    end
end