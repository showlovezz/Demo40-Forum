CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  if Rails.env.production?
	  config.fog_credentials = {
	    provider:              'AWS',                        # required
	    aws_access_key_id:     'AWS_ACCESS_KEY_ID',          # required
	    aws_secret_access_key: 'AWS_SECRET_ACCESS_KEY',      # required
	    region:                'ap-northeast-1'              # optional, defaults to 'us-east-1'
	  }
	  config.fog_directory  = 'S3_BUCKET_NAME'               # required
	else
		config.storage :file
	end
end