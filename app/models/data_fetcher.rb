class DataFetcher
  attr_reader :venues, :artists, :date_times
  def initialize
    @band_connection = Faraday.new(:url => 'https://api.bandsintown.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    @venues = []
    @artists = []
    @date_times = []
  end

  def show_entity
    response = @band_connection.get do |req|
      req.url "/events/search.json?location=Denver,CO"
      # req.headers['X-App-Token'] = 'YOUR_KEY'
      # req.headers['Content-Type'] = 'application/json'
    end

    JSON.parse(response.body)
  end

  def venue
    0.upto(10) do |i|
      @venues << show_entity[0]["venue"]["name"]
    end
  end
end
