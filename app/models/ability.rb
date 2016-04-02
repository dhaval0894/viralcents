class Ability

  
  #to set roles for different users in adminUser
  include CanCan::Ability

  def initialize(user)

    user ||= AdminUser.new
    if user.role == "superadmin"
        can :manage, :all
    else
        alias_action :create, :read, :update, :destroy, :to => :crud
        can :crud, Story
        can :read, ActiveAdmin::Page, :name => "Dashboard"
    end


  end
end
