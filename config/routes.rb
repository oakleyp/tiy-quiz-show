Rails.application.routes.draw do

  resources :users

  resources :quizzes

  resources :submissions

  resources :sessions, only: :create

  get 'welcome/index' => 'welcome#index'

  get '/login', to: 'sessions#new', as: 'login'

  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/register', to: 'users#new', as: 'register'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
