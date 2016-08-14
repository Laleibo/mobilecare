class RidesController < ApplicationController
  def new
    @ride = Ride.new()
  end

  def create
    @ride = Ride.create!(ride_params)
  end

  def show
    @rides = Ride.all
  end

  def request
  end

  def cancel
  end

  def update
  end


private

def ride_params
  params.require(:appointment_id, :wants_ride, :lattitude, :longitude, :return_ride).permit(:confirm_ride, :cancel_ride, :pick_up_time, :eta, :note_to_driver, :request_id, :price_estimation)
end


end
