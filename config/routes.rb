Rails.application.routes.draw do
  resources :companies
  get "/dashboard" => 'dashboard#index', as: :dashboard
  get 'dashboard/properties'
  get 'dashboard/reports'
  
  resources :properties  
  resources :uploads

  devise_for :accounts, controllers: {omniauth_callbacks: 'omniauth'}
  root to: 'home#main'
  resources :companies  do
    resources :properties, only: [:index, :show, :new]
  end


  Rails.application.routes.draw do
  resources :companies
    mount ImageUploader.derivation_endpoint => "derivations/image"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
