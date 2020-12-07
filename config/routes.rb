# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :events
  resources :attendances

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/my-events' => 'users#show'

  get '/attendees' => 'events#show'

  root 'events#index'
end
