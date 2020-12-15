Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :users, only: [:new, :create, :show, :index]
  resources :events, only:[:new, :create, :show, :index]
  resources :attendees, only:[:create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
