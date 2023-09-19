class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new 
  
      if user.admin?
        can :manage, :all 
      else
        cannot :access, :admin 
        cannot :manage, :all 
      end
    end
  end