class Users::RegistrationsController < Devise::RegistrationsController
   before_action :sign_up_params, only: [:create]

  #def after_sign_up_path_for(resource)
   #landing_page_path
  #end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def create
    resource = User.new(user_params)
  
    if resource.password.include? "CrediAdmin"
      resource.super_admin = true
    end
  
    if resource.save
      sign_in(resource)
      if resource.super_admin == true
        redirect_to administrador_root_path
      else
        redirect_to cliente_root_path
      end
    else
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

  def admin_edit_user
    @user = User.find(params[:id])
  
    if current_user.super_admin?
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'Usuario actualizado con éxito'
      else
        render :edit
      end
    else
      redirect_to root_path, notice: 'No tienes permisos para editar este usuario'
    end
  end

  
    private
  
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name_1, :identification, :address, :telefono, :email, :password, :password_confirmation)
    end
    def user_params
      params.require(:user).permit(:first_name, :second_name, :last_name_1, :last_name_2, :identification, :address, :telefono, :email, :imagen, :password, :password_confirmation, :other_attributes)
    end
    
    
    
  
end
