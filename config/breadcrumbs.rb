# frozen_string_literal: true

crumb  :documents do
  link t('documents'), dashboard_path
end

crumb :document do |document|
  link "#{document.name} #{document.url} #{document.document_type} #{document.created_at}", document_path(document)
  parent :documents
end

crumb :buckets do
  link t('buckets'), buckets_path
end

crumb :bucket do |bucket|
  link "#{bucket.name} #{bucket.created_at}", bucket_path(bucket)
  parent :buckets
end
