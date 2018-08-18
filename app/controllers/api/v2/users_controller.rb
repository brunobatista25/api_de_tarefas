class Api::V2::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]

  # mostra todos os usuarios
  def index
    user = User.all
    render json: user, status: 200
  end

  # Mostrar  um usuario especifico pelo id, se nao tiver vai mostar um erro 422
  def show
    begin
      user = User.find(params[:id])
      render json: user, status: 200
    rescue
      render json: { errors: user.errors }, status: 422
    end
  end

  # Cria um usuario,se nao criar por algum motivo vai mostar um erro 422
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  # Edita um usuario,se nao editar por algum motivo vai mostar um erro 422
  def update
    user = current_user
    if user.update(user_params)
      render json: user, status: 200
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  # Apaga um usuario,se não apagar retorna erro 204
  def destroy
    current_user.destroy
    head 204
  end

  private

  # Paramentros do usuaro permitidos para se usar no json
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
