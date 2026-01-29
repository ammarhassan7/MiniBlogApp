Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end

  # Set the homepage to the posts list
  root "posts#index"
end