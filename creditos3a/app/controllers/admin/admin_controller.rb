class Admin::AdminController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :require_admin
  
    private
  
    def require_admin
      unless current_user && current_user.administrador?
        flash.now[:alert] = "Acceso Denegado. No tienes permiso para acceder a esta página."
        render 'denied_access', status: :forbidden
      end
    end
end
