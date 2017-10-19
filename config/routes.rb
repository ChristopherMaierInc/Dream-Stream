Rails.application.routes.draw do

  devise_for :users

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :cart_products, only: [:create, :update, :destroy]

  root to: "products#index"

  get 'checkout', to: 'checkout#new', as: 'new_purchase'

  get 'checkout', to: 'checkout#purchase', as: "purchase_finalized"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
