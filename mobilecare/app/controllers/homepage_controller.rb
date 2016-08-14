class HomepageController < ApplicationController
  def home
    @pick_up_time = UberRideRequest.pick_up_time
    @price = UberRideRequest.price_estimation
  end
end
