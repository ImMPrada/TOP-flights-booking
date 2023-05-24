Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"

  resources :flights, only: [:index] do
    post :filter, on: :collection
  end
end
