Rails.application.routes.draw do
root to: 'dashboard#home', as: 'dashboard_home'

get 'dashboard/admin_users', to: 'dashboard#admin_users'
get 'dashboard/show_user', to: 'dashboard#show_user', as: 'show_user_dashboard'
get '/dashboard/mejores_calificados', to: 'dashboard#mejores_calificados', as: 'dashboard_mejores_calificados'
get '/mensajes', to: 'dashboard#mensajes'



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
      resources :productos, module: :categorias do
        resources :calificaciones, only: [:new, :create]
      end
    end
  end

 
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :user, ->(user) { user.administrador? } do
    root to: 'dashboard#home', as: :administrador_root
  end

  authenticated :user, ->(user) { !user.administrador? } do
    root to: 'home#landing_page', as: :cliente_root
  end
  
  devise_scope :user do
    delete '/users/sign_out' => 'users/sessions#destroy', :as => :delete_user_session
    get '/user_profile', to: 'users/registrations#show', as: :user_profile
    get '/user_profile/edit', to: 'users/registrations#edit', as: :edit_user_profile
    put '/user_profile', to: 'users/registrations#update', as: :update_user_profile
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
  end
    namespace :pages do
      namespace :categorias do
        resources :productos do
          resources :calificaciones, only: [:new, :create]
        end
      end
    end
    

  resources :productos do
    resources :pedidos, only: [:new, :new_with_user_data, :create, :pedidos_realizados]
  end
  
  resources :productos do
    resources :calificaciones, only: [:new, :create, :index]
  end

  resources :pedidos do
    collection do
      get 'pedidos_realizados'
      get 'pedidos_realizados'
    end
  end

  

  # Resto de las rutas...
end
