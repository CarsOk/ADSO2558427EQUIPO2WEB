
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

  def pedidos
    @user = User.find(params[:user_id])
    @pedidos = @user.pedidos
  end

  def show_user
    @users_with_pedidos = User.includes(:pedidos)
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
  
  private

  def authorize
    if current_user.administrador?
      # El usuario es administrador, por lo que se le permite acceder a la página
    else
      # El usuario no es administrador, por lo que se le redirige a la página del cliente
      redirect_to landing_page_path, alert: 'Solo los administradores pueden acceder a esta página.'
    end
  end
end
