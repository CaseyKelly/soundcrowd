class DashboardController < ApplicationController

  def index
    @name = env['omniauth.auth']['info']['name']
    @places = DataFetcher.new
  end

  def show
    @places = DataFetcher.new
    @shows = @places.local_shows
    @hash = Gmaps4rails.build_markers(@shows) do |show, marker|
      marker.lat show["venue"]["latitude"]
      marker.lng show["venue"]["longitude"]
      marker.infowindow show["artists"].first["name"]
    end
  end

end
