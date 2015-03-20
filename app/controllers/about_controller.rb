class AboutController < ApplicationController

  def index
    @user = User.find_by(oauth_id: session[:user_id])
  end

end
