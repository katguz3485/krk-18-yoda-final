# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :buckets
  has_many :documents, through: :buckets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, facebook_uid: auth.facebook_uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.facebook_uid = auth.facebook_uid
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
