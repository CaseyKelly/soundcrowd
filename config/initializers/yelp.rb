Yelp.client.configure do |config|
  config.consumer_key     = env["YELP_KEY"]
  config.consumer_secret  = env["YELP_SECRET"]
  config.token            = env["YELP_TOKEN"]
  config.token_secret     = env["YELP_TOKEN_SECRET"]
end
