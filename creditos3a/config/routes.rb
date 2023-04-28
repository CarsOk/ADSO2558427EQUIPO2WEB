Rails.application.routes.draw do
  root to: "home#landing_page"
  get 'home/dashboard'
  devise_for :users
  get '/index', to: 'home#landing_page'
  resources :productos

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
