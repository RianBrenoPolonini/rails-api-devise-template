# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?

    can(:read, :is_authenticated)
    can(:manage, User, user: user)
  end
end
