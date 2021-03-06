class DemandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # attention si autres utilisateurs // à checker
    end
  end

  def index?
  end

  def create?
    return true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user #|| user.admin
  end

end
