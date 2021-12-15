class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, [Comment, Post]
      can :update, [Comment, Post], user: user
      can :destroy, [Comment, Post], user: user
    end
  end
end
