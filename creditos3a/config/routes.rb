Rails.application.routes.draw do
  get 'dashboard/home'
  get 'home/dashboard'
  
  get '/index', to: 'home#landing_page'
  get '/contacto', to: 'home#contacto'
  resources :categorias do
    resources :productos, module: :categorias
  end 
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    delete '/users/sign_out' => 'users/sessions#destroy', :as => :delete_user_session
  end

  authenticated :user, ->(user) { user.administrador? } do
    root to: 'dashboard#home', as: :administrador_root
  end

  authenticated :user, ->(user) { !user.administrador? } do
    root to: 'home#landing_page', as: :cliente_root
  end

  root to: redirect('/users/sign_in')


   
  resources :contactospqrs, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
