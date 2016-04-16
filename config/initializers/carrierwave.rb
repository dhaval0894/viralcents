CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ' AKIAJHDBBJ7B25NBXQFQ',
    aws_secret_access_key:  '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',
    region: 'ap-southeast-1',
  
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage           = :file
    config.enable_processing = false
    config.root              = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  #config.cache_dir        = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku
  config.fog_directory    = 'test-viralcents'

end
