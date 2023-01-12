module Api
    module V1
        module UserAgenda
            class Routes < Grape::API
                mount Api::V1::UserAgenda::Resources::Agendac
            end
        end
    end
end