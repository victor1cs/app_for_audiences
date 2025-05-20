Rails.application.routes.draw do
  root "index#index"

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :audiences

  get "up" => "rails/health#show", as: :rails_health_check
end
