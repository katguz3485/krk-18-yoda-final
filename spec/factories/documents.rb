# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    name { Faker::Name.name }
    title 'Document'
    document_type 'pdf'
    bucket_id '1'
    date '2018-11-06'
  end
end
