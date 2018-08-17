# frozen_string_literal: true

class Bucket < ApplicationRecord
  belongs_to :user
  has_many :documents
end
