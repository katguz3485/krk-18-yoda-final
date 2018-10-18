class DocumentPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == document.user
  end

  def destroy?
    return true if user.present? && user == document.user
  end

  private

  def document
    record
  end

end