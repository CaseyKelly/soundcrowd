class DashboardController < ApplicationController

  def index
    @name = ENV['omniauth.auth']['info']['name']
