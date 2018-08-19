class Api::V1::SessionsController < ApplicationController
  
  #Ao fazer login busca um usario pelo email, verifica o email e senha,caso de erro retorna 401
  def create
    user = User.find_by(email: sessions_params[:email])

    if user && user.valid_password?(sessions_params[:password])
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200
    else
      render json: { errors: 'Senha ou e-mail inválidos'}, status: 401
    end
  end

  #apaga uma sessao de usuario,ou seja fazer logout
  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end

  private

  #parametros permitidos no json de session
  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
