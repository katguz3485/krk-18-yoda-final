require 'elasticsearch/model'

class Document < ApplicationRecord
  include Searchable
  mount_uploader :file, FileUploader
  belongs_to :bucket
  delegate :user, to: :bucket


end






