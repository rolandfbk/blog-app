Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
    end
  end

  resources :posts, only: [:new, :create, :update, :destroy] do
    resources :comments
    resources :likes
  end

  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      # post 'users/sign_up' => 'users#register'
      post 'users/sign_in' => 'users#login'
      get 'posts' => 'posts#index'
      # post 'posts/create' => 'posts#create'
      get 'comments' => 'comments#index'
      post 'comments/create' => 'comments#create'
    end
  end
end
