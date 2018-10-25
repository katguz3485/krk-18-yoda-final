# frozen_string_literal: true

require 'elasticsearch/model'

class Document < ApplicationRecord
  include Searchable

  #   mapping dynamic: false do
  #     indexes :name, type: :text, analyzer: :english
  #   end

  belongs_to :bucket
  mount_uploader :file, FileUploader
  delegate :user, to: :bucket
end
