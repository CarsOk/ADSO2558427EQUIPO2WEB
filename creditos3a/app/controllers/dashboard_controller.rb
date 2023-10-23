class DashboardController < ApplicationController
  before_action :authenticate_admin_user!
  layout 'admin'
  def home
    @users = User.all
  end
  def admin_users
    @admin_users = AdminUser.all
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
  
  
end
