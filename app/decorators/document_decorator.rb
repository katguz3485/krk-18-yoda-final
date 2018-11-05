# frozen_string_literal: true

class DocumentDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def document_bucket_name
    bucket.present? ? bucket.name.to_s : bucket.name = t('shared.not_exist')
  end



end
