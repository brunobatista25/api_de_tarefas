require 'api_version_contraint'
Rails.application.routes.draw do
  #quero usa o recurso devise_for apenas para sessoes e o controle e o sessions
  devise_for :users, only: [:sessions],
                     controller: { sessions: 'api/v1/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json }, constraints: {subdomain: 'api'}, path: '/' do
    namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1) do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end

    namespace :v2, path: '/', constraints: ApiVersionConstraint.new(version: 2, default: true) do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
