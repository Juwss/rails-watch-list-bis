Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, except: [:destroy, :edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
  # Defines the root path route ("/")
  # root "articles#index"
end
