Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
