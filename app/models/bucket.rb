# frozen_string_literal: true

class
Bucket < ApplicationRecord
  belongs_to :user, optional: true
  has_many :documents
  validates :name, presence: true
end
