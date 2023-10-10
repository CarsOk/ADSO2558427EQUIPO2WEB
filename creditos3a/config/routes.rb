Rails.application.routes.draw do
  get 'home/dashboard'
  get 'home/dashboard'
  namespace :pages do
    get 'quienes_somos', to: 'quienes_somos#index', as: 'quienes_somos'
  end



  

  get 'landing_page' => 'home#landing_page'
  get 'contacto' => 'pages/home#contacto'
  get 'index' => 'home#index'
  constraints(lambda { |request| !request.env['warden'].user || !request.env['warden'].user.administrador? }) do
    get 'categorias', to: 'categorias#denied_access'
    get 'categorias/:id', to: 'categorias#denied_access'
  end
  
   namespace :pages do
    resources :categorias do
      resources :productos, module: :categorias
    end
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

  namespace :pages do
    resources :contactospqrs, only: [:new, :create]
  end

  namespace :admin do
    resources :categorias do
      resources :productos, module: :categorias, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :catalogos, module: :categorias
    end
    namespace :pages do
      namespace :categorias do
        resources :productos
      end
    end

    resources :catalogos, only: [:index, :show] do
      resources :categorias, module: :catalogos 
    end
  end

  # ... Otras rutas ...

  # Rutas para los catálogos fuera del contexto de administrador
  resources :catalogos, only: [:index, :show] do
    resources :categorias, module: :catalogos 
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end