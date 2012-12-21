class Ability
  include CanCan::Ability
	
	 def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
      can :publish, Post
    elsif user.role? :moderator
      can :read, [Post, Comment]
      can [:edit, :update], Comment
    elsif user.role? :member
       can :read, :all
       can :create, [Comment]
       can [:edit, :update], Comment
    end
  end
end