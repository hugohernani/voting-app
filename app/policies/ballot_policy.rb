class BallotPolicy < ApplicationPolicy
  def create?
    !record.voted?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
