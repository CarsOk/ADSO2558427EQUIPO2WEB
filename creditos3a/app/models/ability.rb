class Ability
  include CanCanCan::Ability

  def initialize(user)
    # Si el usuario tiene el rol de administrador
    if user.has_role?(:administrador)
      can :manage, all

       can :read, Pedido, user_id: user.id
    else
      # De lo contrario, el usuario solo puede ver sus propios pedidos y calificaciones
      can :read, Pedido, user_id: user.id
      can :read, Calificacion, user_id: user.id
    end
  end
end
