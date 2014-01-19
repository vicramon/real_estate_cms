RealEstateCMS::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :home, only: [:index]
  resources :dashboard, only: [:index]

  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'

  resources :super_admin, only: [:index] do
    collection do
      resources :sites
      resources :users
    end
  end

  root to: 'home#index'
end
