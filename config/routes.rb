Rails.application.routes.draw do
  resources :allocation_tests
  resources :tests
  resources :slides
  devise_for :users
  get 'landing/index'
  root "landing#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
