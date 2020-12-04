Rails.application.routes.draw do
  resources :events
  resources :enrollments
  # get 'home/index'
  root "users#index"
  # get "users" => "users#index"
  # get "users/new" => "users#new"
  # post "users" => "users#create"
  #  get "users/:id" => "users#destroy "
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  get 'Sign Out' => 'sessions#destroy', as: 'signout'
end


