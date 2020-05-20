Rails.application.routes.draw do
  devise_for :users
  root "applications#index"
  resources :applications, only: [:new, :create, :show]
end
