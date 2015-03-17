class DashboardController < ApplicationController

  def index
    @name = env['omniauth.auth']['info']['name']
    @places = DataFetcher.new
  end

  def show
    @places = DataFetcher.new
  end

end
