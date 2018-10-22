class DocumentDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def document_bucket_name
    bucket.present? ? "#{bucket.name}" : flash[:notice] = t('shared.not_exist')
    #bucket.present? ? "#{bucket.name}" : flash[:notice] = t('shared.not_exist', resource: 'Bucket')
  end

end