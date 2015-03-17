class DashboardController < ApplicationController

  def index
    @user = User.find_by(oauth_id: session[:user_id])
    @places = DataFetcher.new
    @shows = @places.local_shows
    @shows.sort_by!{ |a| [a['ticket_status'], a['datetime'], a["artists"].first["name"]] }
    @hash = Gmaps4rails.build_markers(@shows) do |show, marker|
      marker.lat show["venue"]["latitude"]
      marker.lng show["venue"]["longitude"]
      marker.infowindow show["artists"].first["name"]
    end
  end

  def show
    @user = User.find_by(oauth_id: session[:user_id])
    @places = DataFetcher.new
    @shows = @places.local_shows
    @hash = Gmaps4rails.build_markers(@shows) do |show, marker|
      marker.lat show["venue"]["latitude"]
      marker.lng show["venue"]["longitude"]
      marker.infowindow show["artists"].first["name"]
    end
  end


end
