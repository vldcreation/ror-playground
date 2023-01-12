module Api
    module V1
        module Users
            module Entities
                class Usere < Grape::Entity
                    expose :id
                    expose :email
                    expose :username
                    expose :registered_at
                    expose :created_at
                end
            end
        end
    end
end