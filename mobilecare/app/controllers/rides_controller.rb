class RidesController < ApplicationController
  before_action :set_request_id only:, [:update]
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

def set_request_id
  @ride= Ride.find_by(request_id: ride_params[:request_id])
end

end
