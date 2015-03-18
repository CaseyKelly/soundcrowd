class DashboardController < ApplicationController

  def index
    @user = User.find_by(oauth_id: session[:user_id])
    @places = DataFetcher.new
    if params[:search] == nil
      @location = "Denver, CO"
    else
      @location = params[:search]
    end
    @shows = @places.sorter(params[:sort], @places.local_shows(@location))
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

  def event_venue
    @venues = DataFetcher.new
    @events = @venues.venue_shows(params[:venueid])
    @yelp_info = Yelp.client.search("#{params[:city]}, #{params[:region]}", { term: params[:venue]})
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event["venue"]["latitude"]
      marker.lng event["venue"]["longitude"]
      marker.infowindow event["venue"]["name"]
    end

  end

end
