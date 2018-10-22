class DocumentPolicy < ApplicationPolicy

  permit_user_present_or_owner? :index, :update, :destroy

  private

  def document
    record
  end

  def user_present_and_owner?
    user.present? && user == document.user
  end

end
