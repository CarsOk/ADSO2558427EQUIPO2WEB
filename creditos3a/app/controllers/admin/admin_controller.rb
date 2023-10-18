class Admin::AdminController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin_user!
    before_action :require_admin
  
    private
  
   
    def require_admin
      unless current_admin_user && current_admin_user.administrador?
        flash.now[:alert] = "Acceso Denegado. No tienes permiso para acceder a esta página."
        render 'denied_access', status: :forbidden
    
    end
  end
end
