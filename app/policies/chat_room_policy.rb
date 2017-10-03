class ChatRoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def dasboard?
      return true
    end

    def create?
      return true
    end
end
