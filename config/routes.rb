Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :advertisements
  root to: "advertisements#index"
end
