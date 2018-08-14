require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
        aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
        region: Rails.application.credentials.dig(:aws, :region),
    }
    config.storage = :fog
    config.fog_directory = Rails.application.credentials.dig(:aws, :bucket)
    config.fog_public = false
  end
end