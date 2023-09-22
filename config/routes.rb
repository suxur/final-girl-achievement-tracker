Rails.application.routes.draw do
  authenticated :user do
    root to: "dashboard#show", as: :authenticated_root
  end
  root to: redirect("/users/sign_in")

  devise_for :users

  resource :dashboard, only: :show, controller: "dashboard"
  resource :privacy_policy, only: :show, controller: "privacy_policy"
  resource :profile, only: :show, controller: "users"
  resource :leaderboard, only: :show, controller: "leaderboard"

  resources :locations, param: :slug
  resources :killers, param: :slug
  resources :series, only: %i[index new create edit update]
  resources :plays
  resources :users, only: %i[show update]
end
