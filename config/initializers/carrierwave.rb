require 'carrierwave/storage/fog'

if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
    config.cache_dir = "#{Rails.root}/tmp/"
  end
else
  CarrierWave.configure do |config|
    config.fog_public = false
    config.fog_authenticated_url_expiration = 100
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
        aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
        region: Rails.application.credentials.dig(:aws, :region)
    }
    config.fog_directory = Rails.application.credentials.dig(:aws, :bucket)
  end
end


