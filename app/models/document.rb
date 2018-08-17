# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :bucket
  mount_uploader :file, FileUploader
  delegate :user, to: :bucket
end
