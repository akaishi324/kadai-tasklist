Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [ :new, :create]do
    member do
       get :likes
    end
  end
  resources :favorites, only: [:create, :destroy]
end
