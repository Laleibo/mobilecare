class HomepageController < ApplicationController
  def home
    @pick_up_time = UberRideRequest.pick_up_time
  end
end
