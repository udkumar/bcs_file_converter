CarrierWave.configure do |config|
  # These permissions will make dir and files available only to the user running
  # the servers
  config.permissions = 0600
  config.directory_permissions = 0700
  # config.storage = :file
  # config.storage = :fog

  # This avoids uploaded files from saving to public/ and so
  # they will not be available for public (non-authenticated) downloading
  config.root = Rails.public_path


  config.fog_credentials = {
    provider:              'AWS',                                         # required
    aws_access_key_id:     'AKIAJLO2SZRSGMZ7NEKQ',                        # required
    aws_secret_access_key: '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',    # required
    region:                'us-west-2',
  }
  config.fog_directory  = 'bucketforbildcloud'                            # bucket

  config.fog_public     = false                                            # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}

end
