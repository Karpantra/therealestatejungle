class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def reply?
    return true
  end

  def trash?
    return true
  end

  def untrash?
    return true
  end
end
