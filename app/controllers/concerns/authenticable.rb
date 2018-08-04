module Authenticable

  #busca um usuario com token pelo header da  requisicao
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end

  #verifica se o usuario esta logado para acesar uam determinada action
  def authenticate_with_token!
    render json: { errors: 'Acesso não autorizado!' }, status: 401 unless user_logged_in?
  end

  #verifico se o usuario esta logado
  def user_logged_in?
    current_user.present?
  end
end
