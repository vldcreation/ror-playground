module Api
    module V1
        module UserAgenda
            module Resources
                class Agendac < Grape::API
                    resource :user_agenda do
                        resource :agenda do
                            desc "Get all user agenda"
                            params do
                                requires :user_id, type: Integer, desc: "User id"
                            end
                            get "/" do
                                data = User.includes(:agenda).find(params[:user_id])
                                error!("Not Found", 404) unless data
                                present :data, data, with: Api::V1::UserAgenda::Entities::UserAgendae
                            end

                            desc "Create a user agenda"
                            params do
                                requires :user_id, type: Integer, desc: "User id"
                                requires :title, type: String, desc: "User agenda title"
                                requires :desc, type: String, desc: "User agenda description"
                                requires :priority, type: String, desc: "User agenda priority"
                            end
                            post "/" do
                                user = User.find(params[:user_id])
                                error!("Not Found", 404) unless user

                                present :user, user, with: Api::V1::Users::Entities::Usere

                                data = Agenda.new(
                                    user_id: user.id,
                                    title: params[:title],
                                    desc: params[:desc],
                                    priority: params[:priority]
                                )

                                if data.save
                                    present :agenda, data, with: Api::V1::UserAgenda::Entities::Agendae
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
end