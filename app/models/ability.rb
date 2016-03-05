class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Payment do |payment|
      payment.sender == user || payment.receiver == user
    end
    can :create, Payment
  end
end
