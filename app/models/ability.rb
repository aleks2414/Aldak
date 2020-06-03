# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Not signed user
    user ||= User.new

    # Super admin
    can :manage, :all if user.super_admin?

    # Admin
    can :manage, :all if user.admin?

    # Purchasing manager
    if user.purchases?
      can :read, [Provider, Charter, Product, Order]
      can [:read, :create], Service
    end

    # Sales manager
    if user.sales?
      can [:read, :create], Client
      can :read, Order
      can [:read, :update], Service
      can :create, [CharterPayment, ProviderPayment]
    end
  end
end
