# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :sign_up_params, only: [:create]

   def after_sign_up_path_for(resource)
    landing_page_path
  end
  
    private
  
    def sign_up_params
      params.require(:user).permit(:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address, :email, :password, :password_confirmation)
    end
    
  
end
