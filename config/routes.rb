Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'groups#index'
  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end
end
