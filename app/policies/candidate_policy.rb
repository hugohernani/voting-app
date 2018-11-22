class CandidatePolicy < ApplicationPolicy
  def edit?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
