# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      create_overall_bucket(resource.id)
    end
  end

  private

  def create_overall_bucket(resource_id)
    Bucket.create(name: 'General', user_id: resource_id)
  end
end
