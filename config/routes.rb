Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  devise_scope :user do
    post '/users/customer_sign_in', to: 'users/sessions#customer_guest'
    post '/users/test_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "items#index"

  resources :items do
    resources :purchases, only: [:index, :create]
  end

  get 'items/new', to: 'items#calculate'
end