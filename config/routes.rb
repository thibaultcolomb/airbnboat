Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :boats do
    resources :bookings, only: [:new, :create, :index, :show, :edit, :update]
    end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/dashboard", to: "bookings#index"

  # Defines the root path route ("/")
# config/routes.rb
end
