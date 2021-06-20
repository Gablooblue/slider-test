Rails.application.routes.draw do
  devise_for :admin_users
  resources :results
  resources :choice_tests
  get 'info', to: "info#show", as: "info_show"
  get "after_info", to: "info#after_show", as: "info_after_show"
  get "after_test", to: "info#after_test", as: "after_test_show"
  get "survey", to: "info#survey", as: "survey"
  get "result", to: "info#results", as: "info_result"
  get "instructions", to: "info#instructions", as: "instructions"
  resources :gambles
  resources :allocation_tests
  resources :tests 
  resources :slides
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  get 'landing/index'
  root "landing#index"
  get "users_list", to: "info#users", as: "users"
  get "user_results/:id", to: "info#user", as: "user_result"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
