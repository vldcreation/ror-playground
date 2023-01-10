class Api::V1::AgendasController < ApplicationController
  def index
    agendas = Agenda.all
    render json: agendas, status: :ok
  end

  def show
    # agenda = Agenda.find(params[:id])
    agenda = Agenda.find_by(id: params[:id])
    if agenda
      render json: agenda, status: :ok
    else
      render json: {error: "Agenda not found"}, status: :not_found
    end
  end

  def create
    agenda = Agenda.new(
      title: params[:title],
      desc: params[:desc],
      priority: params[:priority]
    )
    if agenda.save
      render json: agenda
    else
      render json: {errors: agenda.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    agenda = Agenda.find_by(id: params[:id])
    if agenda
      # rescue_from ActiveRecord::ArgumentError, with: :render_unprocessable_entity_response
      
      agenda.title = params[:title] || agenda.title
      agenda.desc = params[:desc] || agenda.desc  
      agenda.priority = params[:priority] || agenda.priority
      if agenda.save
        render json: agenda
      else
        render json: {errors: agenda.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error: "Agenda not found"}, status: :not_found
    end
  end

  def destroy
    agenda = Agenda.find_by(id: params[:id])
    if agenda
      agenda.destroy
      render json: {message: "Agenda deleted successfully"}, status: :ok
    else
      render json: {error: "Agenda not found"}, status: :not_found
    end
  end
end
