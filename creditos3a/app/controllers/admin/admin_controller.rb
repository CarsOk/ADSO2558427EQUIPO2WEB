class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  private

  def require_admin
    if current_user.super_admin? || current_user.administrador?
      # El usuario es administrador, por lo que se le permite acceder a la página
    else
      redirect_to cliente_root_path, alert: 'Solo los administradores pueden acceder a esta página.'
    end
  end
end
