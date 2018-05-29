Rails.application.routes.draw do
  resources :services
  resources :orders
  resources :products
  resources :charters
  resources :providers
  resources :clients
  devise_for :users
  root 'welcome#index'

  resources :contacts, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
