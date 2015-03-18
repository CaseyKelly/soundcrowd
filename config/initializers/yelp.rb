Yelp.client.configure do |config|
  config.consumer_key     = Rails.application.secrets.consumer_key
  config.consumer_secret  = Rails.application.secrets.consumer_secret
  config.token            = Rails.application.secrets.token
  config.token_secret     = Rails.application.secrets.token_secret
end
