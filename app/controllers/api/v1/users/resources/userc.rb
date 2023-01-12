module Api
    module V1
        module Users
            module Resources
                class Userc < Grape::API
                    resource :user do
                        desc "Get all user"
                        params do
                            optional :q, type: String, desc: "Key search"
                        end

                        get "/" do
                            data = User.all.select(:id, :username, :email, :created_at)
                            present :user, data
                        end

                        desc "Get user by id"
                        params do
                            requires :id, type: Integer, desc: "User id"
                        end

                        get "/:id" do
                            data = User.find(params[:id])
                            present :user, datas
                        end

                        desc "Create a user"
                        params do
                            requires :username, type: String, desc: "User name"
                            requires :email, type: String, allow_blank: false, regexp: /.+@.+/, desc: "User email"
                            requires :password, type: String, desc: "User password"
                        end

                        post "/" do
                            user = User.new(
                                username: params[:username],
                                email: params[:email],
                                password: BCrypt::Password.create(params[:password]),
                                registered_at: Time.now
                            )
                            if user.save
                                present :user, user, with: Api::V1::Users::Entities::Usere
                            else
                                error!(user.errors, 400)
                            end
                        end
                        
                    end
                end
            end
        end
    end
end