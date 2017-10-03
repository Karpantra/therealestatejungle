class MailboxPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def inbox?
    return true
  end

  def sent?
    return true
  end

  def trash?
    return true
  end
end
