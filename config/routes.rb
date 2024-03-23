# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:create]
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :books
  resources :genres, only: %i[create index destroy]
  resources :tags, only: %i[create index destroy]

  # Defines the root path route ("/")
  # root "posts#index"
end
