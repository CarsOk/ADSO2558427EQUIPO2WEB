class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  private

  def require_admin
    unless current_user
      flash.now[:alert] = "Acceso Denegado. Debes estar conectado para acceder a esta página."
      render 'denied_access', status: :forbidden
    end
  end
end
