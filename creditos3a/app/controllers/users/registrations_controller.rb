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

  ¿
  def create
    build_resource(sign_up_params)
  
    
    if resource.valid? && validar_identificacion_sin_letras(resource) && validar_nombre_sin_numeros(resource)
  
      # Chequea la contraseña para el super admin
      if resource.password.include?("CrediAdmin")
        resource.super_admin = true
      end
  
      if resource.save
        sign_in(resource)
  
        # Redirecciona según el tipo de usuario
        if resource.super_admin
          redirect_to administrador_root_path
        else
          redirect_to cliente_root_path
        end
      else
        clean_up_passwords(resource)
        render :new
      end
    else
      # Mantiene los errores de validación existentes
      render :new
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_profile_path, notice: 'Perfil actualizado con éxito'
    else
      render :edit
    end
  end


  def validar_identificacion_sin_letras(resource)
    if resource.identification.to_s.match?(/[a-zA-Z]/)
      resource.errors.add(:identification, "no debe contener letras")
      return false
    end

    true
  end

  
  def validar_telefono_sin_letras(resource)
    if resource.telefono.to_s.match?(/[a-zA-Z]/)
      resource.errors.add(:telefono, "no debe contener letras")
      return false
    end

    true
  end


  def validar_nombre_sin_numeros(resource)
    if resource.first_name.to_s.match?(/\d/) || resource.second_name.to_s.match?(/\d/) || resource.last_name_1.to_s.match?(/\d/) || resource.last_name_2.to_s.match?(/\d/)
      resource.errors.add(:base, "Los campos de nombre y apellido no deben contener números")
      return false
    end

    true
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address, :telefono, :email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address, :telefono, :email, :imagen, :password, :password_confirmation, :other_attributes)
  end
end


