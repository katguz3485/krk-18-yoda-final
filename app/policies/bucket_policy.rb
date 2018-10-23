# frozen_string_literal: true

class BucketPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == bucket.user
  end

  def destroy?
    return true if user.present? && user == bucket.user
  end

  private

  def bucket
    record
  end

  private

  def bucket
    record
  end
end
