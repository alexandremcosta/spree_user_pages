module Spree
  class AbilityDecorator
    include CanCan::Ability
    def initialize(user)
      can :update, Page do |page|
        page.user && page.user == user
      end
    end
  end

  Ability.register_ability(AbilityDecorator)
end

