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
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @places.notparsed}
    end
  end

  def event_venue
    @user = User.find_by(oauth_id: session[:user_id])
    @venues = DataFetcher.new
    @events = @venues.venue_shows(params[:venueid])
    @yelp_info = Yelp.client.search("#{params[:city]}, #{params[:region]}", { term: params[:venue], cll: "#{params[:latitude]},#{params[:longitude]}" })
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event["venue"]["latitude"]
      marker.lng event["venue"]["longitude"]
      marker.infowindow event["venue"]["name"]
    end

  end

  def event_artist
    @user = User.find_by(oauth_id: session[:user_id])
    @artist = DataFetcher.new
    @performances = @artist.artist_allshows(params[:artistid])
  end
end
