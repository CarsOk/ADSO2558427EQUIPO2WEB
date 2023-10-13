Rails.application.routes.draw do
root to: 'dashboard#home', as: 'dashboard_home'

get 'dashboard/admin_users', to: 'dashboard#admin_users'
get 'dashboard/show_user', to: 'dashboard#show_user', as: 'show_user_dashboard'




  namespace :pages do
    get 'quienes_somos', to: 'quienes_somos#index', as: 'quienes_somos'
  end

  get 'landing_page' => 'home#landing_page'
  get 'contacto' => 'pages/home#contacto'
  get 'index' => 'home#index'

  # Restricciones
  constraints(lambda { |request| !request.env['warden'].user || !request.env['warden'].user.administrador? }) do
    get 'categorias', to: 'categorias#denied_access'
    get 'categorias/:id', to: 'categorias#denied_access'
  end

  # Rutas para categorías y productos
  namespace :pages do
    resources :categorias do
      resources :productos, module: :categorias
    end
  end

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations',
      # Reemplaza con tu controlador personalizado
  }
  # Rutas de autenticación
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  authenticated :admin_user do
    root to: 'dashboard#home', as: :administrador_root
  end

  devise_scope :user do
    delete '/users/sign_out' => 'users/sessions#destroy', :as => :delete_user_session
  end


  authenticated :user, ->(user) { !user.administrador? } do
    root to: 'home#landing_page', as: :cliente_root
  end

  root to: redirect('/users/sign_in')


  # Rutas para contactospqrs
  namespace :pages do
    resources :contactospqrs, only: [:new, :create]
  end

  # Rutas para administrador
  namespace :admin do
    resources :categorias do
      resources :productos, module: :categorias, only: [:index, :new, :create, :edit, :update, :destroy]
    end
    namespace :pages do
      namespace :categorias do
        resources :productos
      end
    end
  end

  resources :productos do
    resources :pedidos, only: [:new, :create, :pedidos_realizados]
  end
  resources :pedidos do
    collection do
      get 'pedidos_realizados'
    end
  end

  # Resto de las rutas...
end
