Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items
  get 'items/new', to: 'items#calculate'
end