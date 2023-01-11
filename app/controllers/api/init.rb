module Api
    class Init < Grape::API
        prefix 'api'
        version 'v1', using: :path
        format :json
        mount Api::V1::Todo
    end
end