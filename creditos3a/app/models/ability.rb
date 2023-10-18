class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Por defecto, un usuario no autenticado

    if user.is_a?(AdminUser) && user.administrador?
      # Capacidad para AdminUser con administrador == true
      can :manage, :all  
    else
      # Capacidad para User (usuario normal)
      can :create, Pedido # Los usuarios normales pueden crear pedidos
      can :read, Pedido, user_id: user.id   # Los usuarios normales pueden ver sus propios pedidos
    end
  end
end