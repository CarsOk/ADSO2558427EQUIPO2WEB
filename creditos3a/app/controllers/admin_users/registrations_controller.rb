# frozen_string_literal: true

class AdminUsers::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

   protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address])
  end
end
