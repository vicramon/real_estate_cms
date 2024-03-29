RealEstateCMS::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :super_admin, only: [:index] do
    collection do
      resources :sites
      resources :users
    end
  end

  resources :admin, only: [:index]

  namespace :admin do
    resources :agents
    resources :pages do
      get 'reorder', on: :collection
      patch 'update_order', on: :collection
      resources :blocks, only: [:new, :create, :destroy] do
        get 'reorder', on: :collection
        patch 'update_order', on: :collection
      end
    end
  end

  resources :pages, only: [:show]

  get '*path', to: 'pages#show'

  root to: 'pages#show'

end
