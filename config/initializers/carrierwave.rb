CarrierWave.configure do |config|

	config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],       # required
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region:                'eu-west-1'    # required
    
  }
  config.fog_directory  = ENV["AWS_BUCKET"]                         # required
end 