RealEstateCMS::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :home, only: [:index]
  resources :dashboard, only: [:index]

  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :super_admin, only: [:index] do
    collection do
      resources :sites
      resources :users
    end
  end

  resources :admin

  namespace :admin do
    resources :pages
  end

  root to: 'pages#index'

end
