Rails.application.routes.draw do
  authenticated :user do
    root to: "killers#index", as: :authenticated_root
  end
  root to: redirect("/users/sign_in")

  devise_for :users
  resources :locations, param: :slug, only: %i[index show]
  resources :killers, param: :slug, only: %i[index show]
  resources :users
  resource :home, only: :show, controller: "home"
  resource :privacy_policy, only: :show, controller: "privacy_policy"
end
