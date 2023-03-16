Rails.application.routes.draw do
  resources :plays
  authenticated :user do
    root to: "killers#index", as: :authenticated_root
  end
  root to: redirect("/users/sign_in")

  devise_for :users

  resources :locations, param: :slug, only: %i[index show edit update]
  resources :killers, param: :slug, only: %i[index show edit update]
  resources :users
  resource :home, only: :show, controller: "home"
  resources :plays, only: %i[index new create destroy]

  resource :privacy_policy, only: :show, controller: "privacy_policy"
end
