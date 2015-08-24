Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:new, :create, :destroy]
  root to: "users#new"
end
