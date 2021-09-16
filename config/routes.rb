# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  # post '/', to: 'sessions#create' #just guessing that we want a welcome root
end
