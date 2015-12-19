Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  root 'home#index'

  resources :users, only: [:show] do
    resources :seasons, only: [:index, :show, :new, :create]
  end

  resources :days, only: [:show]
end
