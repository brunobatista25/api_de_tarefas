class Api::V1::TasksController < ApplicationController
  #esse metodo roda antes de todos os metodos para verificar se usuario esta logado
  before_action :authenticate_with_token!

  #lista todas as tarefas do usuario corrente
  def index
    tasks = current_user.tasks
    render json: { tasks: tasks }, status: 200
  end

  #lista as tarefas do usuario logado
  def show
    task = current_user.tasks.find(params[:id])
    render json: task, status: 200
  end

  #cria uam tarefa nova associada a um usario logado, se nao mostra o erro 422
  def create
    task = current_user.tasks.build(task_params)

    if task.save
      render json: task, status: 201
    else
      render json: { errors: task.errors }, status: 422
    end
  end

  #atualiza uma tarefa pra o usuario logado
  def update
    task = current_user.tasks.find(params[:id])

    if task.update_attributes(task_params)
      render json: task, status: 200
    else
      render json: { errors: task.errors }, status: 422
    end
  end

  #apaga uma tarefa do usuario logado
  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    head 204
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :done)
  end
end
