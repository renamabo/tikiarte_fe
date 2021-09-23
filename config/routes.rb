# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
  get '/auth/failure', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'

  resources :user, only: :show do
    resources :artists, controller: 'user_artists' do
      resources :art_pieces, only: [:create, :new, :update, :destroy]
    end
  end

  resources :public_gallery, only: :index
  resources :inspiration, only: :index
  resources :account_management, only: :index
end
