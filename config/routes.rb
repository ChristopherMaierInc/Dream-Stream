Rails.application.routes.draw do

  devise_for :users

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :cart_products, only: [:create, :update, :destroy]
  resources :checkout, only: [:create]

  root to: "products#index"

  get 'products/contact', to: 'products#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
