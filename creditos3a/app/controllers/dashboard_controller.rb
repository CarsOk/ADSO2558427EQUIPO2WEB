class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  before_action :check_admin

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
  private

  def check_admin
    unless current_user.administrador?
      redirect_to root_path, alert: 'No tienes permisos para acceder a esta página.'
    end
  end
  
end
