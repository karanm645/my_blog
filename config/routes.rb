Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: "logout"
  
  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, except: [:new]
end
