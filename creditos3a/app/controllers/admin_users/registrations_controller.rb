# frozen_string_literal: true

class AdminUsers::RegistrationsController < Devise::RegistrationsController
  
   before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def show
    @admin_user = current_admin_user
  end
  
  def edit
    @admin_user = current_admin_user
  end
  
  def update
    @admin_user = current_admin_user
    if @admin_user.update(admin_user_params)

      redirect_to admin_user_profile_path, notice: 'Perfil de administrador actualizado con éxito'
    else
      render :edit
    end
  end
  



  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address])
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address)
  end
  
end
