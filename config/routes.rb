Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  root to: "users#new"
end
