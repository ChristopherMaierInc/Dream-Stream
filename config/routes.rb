Rails.application.routes.draw do

  devise_for :users

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root to: "products#index"

  get 'checkout', to: 'checkout#new', as: 'new_order'

  get 'checkout', to 'checkout#purchase', as "purchase_order"

  # get 'pages/home', to: 'pages#home', as: 'home'
  # 
  # get 'pages/checkout', to: 'pages#checkout', as: 'checkout'
  #
  # post 'pages/checkout', to: 'pages#purchase', as: 'purchase'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
