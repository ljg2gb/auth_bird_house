Rails.application.routes.draw do
  resources :birds, only: [:index, :create]
  resources :users, only: [:create]
  post "login", to: "authentication#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
