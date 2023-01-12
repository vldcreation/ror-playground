module Api
    module V1
        class Main < Grape::API
            prefix 'api'
            version 'v1', using: :path
            format :json
            mount Api::V1::Users::Routes
            mount Api::V1::UserAgenda::Routes
        end
    end
end