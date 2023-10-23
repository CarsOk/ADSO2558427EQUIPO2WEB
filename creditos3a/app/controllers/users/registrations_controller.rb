# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :sign_up_params, only: [:create]

   def after_sign_up_path_for(resource)
    landing_page_path
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_profile_path, notice: 'Perfil actualizado con éxito'
    else
      render :edit
    end
  end

  
    private
  
    def sign_up_params
      params.require(:user).permit(:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address, :email, :password, :password_confirmation)
    end
    def user_params
      params.require(:user).permit(:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address, :email, :imagen, :other_attributes)
    end
    
    
  
end
