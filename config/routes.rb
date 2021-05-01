Rails.application.routes.draw do
  resources :types, only: [:new, :show, :index, :create]
  resources :expenses, only: [:new, :show, :index, :create]
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'home#index'
end
