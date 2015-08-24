Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show] do
    resources :user_comments
  end

  resources :goals do
    resources :goal_comments
  end

  resource :session, only: [:new, :create, :destroy]

  root to: "goals#index"
end
