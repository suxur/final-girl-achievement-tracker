Rails.application.routes.draw do
  resources :delete_mes
  authenticated :user do
    root to: "home#show", as: :authenticated_root
  end
  root to: redirect("/users/sign_in")

  devise_for :users
  resources :locations, param: :slug, only: %i[show]
  resources :killers, param: :slug, only: %i[show]
  resources :users
  resource :home, only: :show, controller: "home"
  resource :privacy_policy, only: :show, controller: "privacy_policy"
end
