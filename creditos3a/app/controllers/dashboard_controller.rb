
class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize, only: [:home, :admin_users, :pedidos, :show_user, :mejores_calificados, :mensajes]
  layout 'admin'

  def home
    @users = User.all
  end
  def admin_users
    @users = User.all
  end

  def show_user
    @users_with_pedidos = User.includes(:pedidos)

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'lista_pedidos', :layout => true,
              :header => {
                :left => 'Creditos 3A',
                :right => Time.now.strftime('%d/%m/%Y')
              },
              :footer => {
                :right => 'Copyright © 2023'
              }
      end
    end
  end
  
  
  def mejores_calificados
    @productos = Producto.all.order(rating_average: :desc).limit(10)
  end

  def mensajes
    @contactospqrs = Contactopqrs.all
    flash[:success] = 'Mensajes cargados correctamente.'

    # Asigna el producto asociado a cada contactopqrs
    @contactospqrs.each do |contactopqrs|
        contactopqrs.producto = Producto.find(contactopqrs.producto_id)
    end
  end

  def edit_admin_user
    @user = User.find(params[:id])

    if current_user.super_admin?
      if @user.update(user_params)
        redirect_to dashboard_admin_users_path, notice: 'Usuario actualizado con éxito'
      else
        render :edit
      end
    else
      redirect_to root_path, notice: 'No tienes permisos para editar este usuario'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :first_name, :second_name, :last_name_1, :last_name_2, :identification, :address, :administrador)
  end

  def authorize
    if current_user.super_admin? || current_user.administrador?
      # El usuario es administrador, por lo que se le permite acceder a la página
    else
      # El usuario no es administrador, por lo que se le redirige a la página del cliente
      redirect_to landing_page_path, alert: 'Solo los administradores pueden acceder a esta página.'
    end
  end


 
end
