Rails.application.routes.draw do
  resources :companies, except: [:show]
  resources :provider_payments
  resources :charter_payments
  resources :services, except: [:edit] do
    member do
      get 'etapa_1'
      get 'etapa_2'
      get 'etapa_3'
      get 'etapa_4'
      get 'etapa_5'
  end
end
  resources :orders
  resources :products
  resources :charters
  resources :providers
  resources :clients

  # match '/users/:id', to: 'users#show', via: 'get'
  devise_for :users, :path_prefix => 'd'
  resources :users, except: [:show]

  root 'welcome#index'
  get 'reindex' => 'welcome#reindex'

  resources :contacts, only: [:new, :create]

  get '/reporte' => 'pages#reporte'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
