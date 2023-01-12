module Api
    module V1
        class Todo < Grape::API
            resources :todos do
                desc "Return list of todos"
                get do
                    @agenda = Agenda.all
                    {
                        "message": "List of todos",
                        "code": 200,
                        "todos": @agenda
                    }
                end

                desc "Return a todo"
                params do
                    requires :id, type: Integer, desc: "Todo id."
                end
                route_param :id do
                    get do
                        @agenda = Agenda.find(params[:id])
                        error!("Not Found", 404) unless @agenda
                        {
                            "message": "Todo",
                            "code": 200,
                            "todo": @agenda
                        }
                    end
                end

                desc "Create a todo"
                params do
                    requires :user_id, type: Integer, desc: "User id."
                    requires :title, type: String, desc: "Todo title."
                    requires :desc, type: String, desc: "Todo description."
                    requires :priority, type: String, desc: "Todo priority."
                end
                post do
                    @agenda = Agenda.new(
                        user_id: params[:user_id],
                        title: params[:title],
                        desc: params[:desc],
                        priority: params[:priority]
                    )
                    if @agenda.save
                        {
                            "message": "Todo created",
                            "code": 201,
                            "todo": @agenda
                        }
                    else
                        error!(@agenda.errors, 400)
                    end
                end


                desc "Update a todo"
                params do
                    requires :id, type: Integer, desc: "Todo id."
                    requires :user_id, type: Integer, desc: "User id."
                    optional :title, type: String, desc: "Todo title."
                    optional :desc, type: String, desc: "Todo description."
                    optional :priority, type: String, desc: "Todo priority."
                end

                route_param :id do
                    put do
                        @agenda = Agenda.find(params[:id])
                        error!("Not Found", 404) unless @agenda
                        if @agenda.update(
                            user_id: params[:user_id] || @agenda.user_id,
                            title: params[:title] || @agenda.title,
                            desc: params[:desc] || @agenda.desc,
                            priority: params[:priority] || @agenda.priority
                        )
                            {
                                "message": "Todo updated",
                                "code": 200,
                                "todo": @agenda
                            }
                        else
                            error!(@agenda.errors, 400)
                        end
                    end
                end
                
                desc "Delete todo"
                params do
                    requires :id, type: Integer, desc: "Todo id."
                end

                route_param :id do
                    delete do
                        @agenda = Agenda.find(params[:id])
                        error!("Not Found", 404) unless @agenda
                        if @agenda.destroy
                            {
                                "message": "Todo deleted",
                                "code": 200,
                                "todo": @agenda
                            }
                        else
                            error!(@agenda.errors, 400)
                        end
                    end
                end



            end
        end
    end
end