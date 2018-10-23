# frozen_string_literal: true

class DocumentPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    user_present_and_owner?
  end

  def destroy?
    user_present_and_owner?
  end

  private

  def document
    record
  end

  def user_present_and_owner?
    user.present? && user == document.user
  end
end
