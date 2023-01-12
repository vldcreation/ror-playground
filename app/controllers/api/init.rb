module Api
    class Init < Grape::API
        mount Api::V1::Main
    end
end