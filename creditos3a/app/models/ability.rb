class Ability
  include CanCanCan::Ability

  def initialize(user)
    # Si el usuario es un super administrador
    if user.super_admin?
      can :manage, :all
    # Si el usuario es un administrador
    elsif user.administrador?
      can :manage, :admin
      can :manage, :categoria
      can :manage, :producto
       can :read, Pedido, user_id: user.id
    else
      # De lo contrario, el usuario solo puede ver sus propios pedidos y calificaciones
      can :read, Pedido, user_id: user.id
      can :read, Calificacion, user_id: user.id
    end
  end
end
