class Api::V2::TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :done, :deadline, :user_id, :created_at,
             :updated_at, :short_description, :is_late

  # Pega o objeto task e pega sua descricao e exibe uma descricao curta
  # com no max 40 caracteres
  def short_description
    object.description[0..40] if object.description.present?
  end

  # Verifica se a tarefa esta atrasa ou nao
  def is_late
    Time.current > object.deadline if object.deadline.present?
  end

  # Nao sei se e valido usar na api
  # Retorna os dados de usuario no json task
  belongs_to :user
end
