Rails.application.routes.draw do
  # get 'home/index'
  root "users#index"
  # get "users" => "users#index"
  # get "users/new" => "users#new"
  # post "users" => "users#create"
  #  get "users/:id" => "users#show"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
