# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def destroy
      super
  end
  def after_sign_in_path_for(resource)
    if resource.administrador?
      # Redirige al root de administrador si el usuario es un administrador
      dashboard_home_path
    else
      # Redirige al root de cliente si el usuario no es un administrador
      landing_page_path
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
