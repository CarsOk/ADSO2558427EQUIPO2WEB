# config/routes.rb
Rails.application.routes.draw do
  get 'dashboard/home'
  get 'home/dashboard'
  get '/quienes_somos', to: 'quienes_somos#index'

  

  get '/index', to: 'home#landing_page'
  get '/contacto', to: 'home#contacto'
  
  constraints(lambda { |request| !request.env['warden'].user || !request.env['warden'].user.administrador? }) do
    get 'categorias', to: 'categorias#denied_access'
    get 'categorias/:id', to: 'categorias#denied_access'
  end
  
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
  resources :catalogos, only: [:index, :show] do
    resources :categorias, module: :catalogos do
      resources :productos, only: [:index, :show] # Cambiar :idex a :index
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
