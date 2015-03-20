class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class OverCapacity < StandardError; end
  rescue_from OverCapacity, with: :over_capacity

  class MissingVenue < StandardError; end
  rescue_from MissingVenue, with: :missing_venue

   private

     def over_capacity
       render file: "/public/404.html", status: 404
     end

     def missing_venue
       render file: "/public/422.html", status: 404
     end

end
