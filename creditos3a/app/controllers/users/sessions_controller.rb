# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def destroy
      super
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # Redirige al inicio de sesión de usuarios
  end
  
  def after_sign_in_path_for(resource)
    if resource.super_admin? || resource.administrador?
      # Redirige al root de administrador si el usuario es un administrador
      dashboard_home_path
    else
      # Redirige al root de cliente si el usuario no es un administrador
      landing_page_path
    end
  end

end
