# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
  get '/logout', to: 'sessions#delete'

  resources :user, only: :show do
    resources :artists, controller: 'user_artists'
  end
  resources :public_gallery, only: :index
end
