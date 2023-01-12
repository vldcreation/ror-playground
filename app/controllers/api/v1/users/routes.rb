module Api
    module V1
        module Users
            class Routes < Grape::API
                
                mount Api::V1::Users::Resources::Userc
            end
        end
    end
end