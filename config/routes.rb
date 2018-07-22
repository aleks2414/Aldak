Rails.application.routes.draw do
  resources :provider_payments
  resources :charter_payments
  resources :services, except: [:edit] do
    member do
      get 'etapa_1'
      get 'etapa_2'
      get 'etapa_3'
      get 'etapa_4'
      get 'etapa_5'
      get 'etapa_6'
  end
end
  resources :orders
  resources :products
  resources :charters
  resources :providers
  resources :clients
  devise_for :users
  root 'welcome#index'

  resources :contacts, only: [:new, :create]

  get '/reporte' => 'pages#reporte'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
