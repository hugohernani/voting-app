class ElectionPolicy < ApplicationPolicy
  def show?
    true
  end

  def admin_show?
    true
  end

  def admin_new?
    true
  end

  def admin_create?
    true
  end

  def running?
    record.running?
  end

  def reveal_result?
    record.has_ended?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
