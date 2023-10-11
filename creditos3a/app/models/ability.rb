class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Por defecto, un usuario no autenticado

    if user.is_a?(AdminUser) && user.administrador?
      # Capacidad para AdminUser con administrador == true
      can :manage, :all  
    else
      # Capacidad para User (usuario normal)
      cannot :access, :admin  # No pueden acceder al controlador/admin
      cannot :manage, :all    # No pueden gestionar ninguna acción
    end
  end
  end