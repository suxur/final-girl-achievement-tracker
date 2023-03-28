Rails.application.routes.draw do
  authenticated :user do
    root to: "dashboard#show", as: :authenticated_root
  end
  root to: redirect("/users/sign_in")

  devise_for :users

  resource :home, only: :show, controller: "home"
  resource :dashboard, only: :show, controller: "dashboard"
  resource :privacy_policy, only: :show, controller: "privacy_policy"
  resource :profile, only: :show, controller: "users"

  resources :locations, param: :slug, only: %i[index show edit update]
  resources :killers, param: :slug, only: %i[index show edit update]
  resources :plays
  resources :users, only: %i[show update]
end
