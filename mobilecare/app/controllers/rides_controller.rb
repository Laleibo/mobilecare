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
  def pick_up_time
    ride_time_in_minutes = UberRideRequest.time_estimation / 60.0
    appointment_time = DateTime.strptime(CareCloud.get_time_of_appointment)
    app_time_in_secs = (appointment_time.hour * (60 * 60)) + (appointment_time.minute * (60))
    seconds_uber_pick_up = app_time_in_secs - 900 - (ride_time_in_minutes * 60)
    app_hour = seconds_uber_pick_up.to_i / (60 * 60)
    app_min = (seconds_uber_pick_up.to_i % (60 * 60)) / 60
  end



private

def ride_params
  params.require(:appointment_id, :wants_ride, :lattitude, :longitude, :return_ride).permit(:confirm_ride, :cancel_ride, :pick_up_time, :eta, :note_to_driver)
end
end
