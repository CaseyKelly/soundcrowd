class DataFetcher
  attr_reader :venues, :artists, :date_times, :parsed, :notparsed
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

  def fetch_local_shows(location)
    Rails.cache.fetch(location, expires_in: 12.hours) do
      response = @band_connection.get do |req|
        req.url "/events/search.json?location=#{location}"
      end
    end
  end

  def local_shows(location)
    @notparsed = fetch_local_shows(location).body
    parsed = JSON.parse(fetch_local_shows(location).body)
  end

  def venue_shows(venueid)
    response = @band_connection.get do |req|
      req.url "/venues/#{venueid}/events.json?app_id=SOUNDCROWD"
      # req.headers['X-App-Token'] = 'YOUR_KEY'
      # req.headers['Content-Type'] = 'application/json'
    end
    @notparsed = response.body
    parsed =  JSON.parse(response.body)
  end

  def get_venues
    parsed.each do |venue|
      @venues << venue["venue"]["name"]
    end
    @venues
  end

  def artist_allshows(artistid)
    response = @band_connection.get do |req|
      req.url "/artists/Nas/events.json?&api_version=2.0&app_id=SOUNDCROWD"
      # req.headers['X-App-Token'] = 'YOUR_KEY'
      # req.headers['Content-Type'] = 'application/json'
    end
    @notparsed = response.body
    parsed =  JSON.parse(response.body)
  end

  def sorter(ord, shows)
    if ord == 'Artist'
      shows.sort_by!{ |a| [a["artists"].first["name"], a['datetime']] }
    elsif ord == 'Venue'
      shows.sort_by!{ |a| [a['venue']['name'], a['datetime']] }
    elsif ord == 'Date'
      shows.sort_by!{ |a| [a['datetime'], a["artists"].first["name"]] }
    elsif ord == 'TicketAvailable'
      shows.sort_by!{ |a| [a['ticket_status'], a['datetime']] }
    else
      shows.sort_by!{ |a| [a['ticket_status'], a['datetime'], a["artists"].first["name"]] }
    end
  end

end
