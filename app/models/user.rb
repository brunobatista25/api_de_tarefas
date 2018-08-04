class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validando que o token e unico
  validates_uniqueness_of :auth_token

  #antes de criar o usuario vou executar a tarefa generate_authentication_token!
  before_create :generate_authentication_token!

  #usuario tem varias atividades
  #dependent toda vez que eu apago um usuario apago as tasks
  has_many :tasks, dependent: :destroy

  #ao criar um usuario gera um informaçaão do email data de criaçaão e o token
  def info
    "#{email} - #{created_at} - Token: #{Devise.friendly_token}"
  end

  #Gera um token unico verificando se no banco nao tem nenhum usuario com esse mesmo token
  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while User.exists?(auth_token: auth_token)
  end
end
