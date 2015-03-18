class DashboardController < ApplicationController

  def index
    @user = User.find_by(oauth_id: session[:user_id])
    @places = DataFetcher.new
    @shows = @places.sorter(params[:sort], @places.local_shows)
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @places.notparsed}
    end
    # @hash = Gmaps4rails.build_markers(@shows) do |show, marker|
    #   marker.lat show["venue"]["latitude"]
    #   marker.lng show["venue"]["longitude"]
    #   marker.title show['id'].to_s
    #   marker.infowindow show["artists"].first["name"]
    # end
  end

  def show
    @user = User.find_by(oauth_id: session[:user_id])
    @places = DataFetcher.new
    @shows = @places.local_shows
    # @hash = Gmaps4rails.build_markers(@shows) do |show, marker|
    #   marker.lat show["venue"]["latitude"]
    #   marker.lng show["venue"]["longitude"]
    #   marker.infowindow show["artists"].first["name"]
    # end
  end


end
