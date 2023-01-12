module Api
    module V1
        module UserAgenda
            module Entities
                class Agendae < Grape::Entity
                    expose :id
                    expose :user_id
                    expose :title
                    expose :desc
                    expose :priority
                    expose :created_at
                end
            end
        end
    end
end