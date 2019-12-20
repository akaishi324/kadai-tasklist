Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks do
     member do
      get :favorites
      get :favoriters
    end
    collection do
      get :search
    end
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [ :new, :create] do
     member do
      get :favorites
      get :favoriters
    end
    collection do
      get :search
    end
  end
  resources :relationships, only: [:create, :destroy]
end
