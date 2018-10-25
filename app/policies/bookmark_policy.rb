class BookmarkPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def show?
    true if record.users.include?(user) || record.user == user
  end

  def update?
    user.present? && record.user == user
  end

  def destroy?
    user.present? && record.user == user
  end
end
