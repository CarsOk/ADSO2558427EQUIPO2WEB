Rails.application.routes.draw do
  get 'dashboard/home'
  root to: "home#landing_page"
  get 'home/dashboard'
  devise_for :users
  get '/index', to: 'home#landing_page'
  get '/contacto', to: 'home#contacto'
  resources :categorias do
    resources :productos, module: :categorias
  end  
  resources :contactospqrs, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
