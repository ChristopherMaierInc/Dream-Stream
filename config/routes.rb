Rails.application.routes.draw do

  devise_for :users

  root 'pages#home'

  get 'pages/home', to: 'pages#home', as: 'home'

  get 'pages/checkout', to: 'pages#checkout', as: 'checkout'

  post 'pages/checkout', to: 'pages#purchase', as: 'purchase'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
