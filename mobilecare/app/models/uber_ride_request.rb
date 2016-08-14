class UberRideRequest < ApplicationRecord
  def self.create_ride
    start_lat = CareCloud.get_patient_address[0]
    start_long = CareCloud.get_patient_address[1]
    end_lat = CareCloud.get_office_location[0]
    end_long = CareCloud.get_office_location[1]
    header = {'Authorization' => "Bearer #{ENV['UBER_AUTH']}"}

    # HTTParty.get("https://sandbox-api.uber.com/v1/requests/8abd8aeb-87ff-433b-9dd7-57f7fe922aff", headers: header)
    {
   request_id: "852b8fdd-4369-4659-9628-e122662ad257",
   product_id: "a1111c8c-c720-46c3-8534-2fcdd730040d",
   status: "processing",
   vehicle: "Lamborgni Mercy",
   driver: "Ronald Mcdonald",
   location: "Mars",
   eta: 5,
   surge_multiplier: 1.0
      }
  end

  def self.ride_request
    start_lat = CareCloud.get_patient_address[0]
    start_long = CareCloud.get_patient_address[1]
    end_lat = CareCloud.get_office_location[0]
    end_long = CareCloud.get_office_location[1]
    header = {'Authorization' => "Bearer #{ENV['UBER_AUTH']}"}
    HTTParty.get("https://sandbox-api.uber.com/v1/estimates/price?start_latitude=#{start_lat}&start_longitude=#{start_long}&end_latitude=#{end_lat}&end_longitude=#{end_long}", headers: header)
  end

  def self.pick_up_time
    ride_time_in_minutes = UberRideRequest.time_estimation / 60.0
    appointment_time = DateTime.strptime(CareCloud.get_time_of_appointment)
    app_time_in_secs = (appointment_time.hour * (60 * 60)) + (appointment_time.minute * (60))
    seconds_uber_pick_up = app_time_in_secs - 900 - (ride_time_in_minutes * 60)
    app_hour = seconds_uber_pick_up.to_i / (60 * 60)
    app_min = (seconds_uber_pick_up.to_i % (60 * 60)) / 60
  end

  def self.schedule_ride
    Ride.create!(appointment_id: CareCloud.get_appointment_id, wants_ride: true, confirm_ride: false, cancel_ride: false, lattitude: CareCloud.get_patient_address[0], longitude: CareCloud.get_patient_address[1], request_id:'852b8fdd-4369-4659-9628-e122662ad257', price_estimation: UberRideRequest.price_estimation, pick_up_time: pick_up_time, eta: 0, note_to_driver: "0", return_ride: true)
  end

  def self.cancel_ride
    @ride.destroy if @ride.cancel_ride == true
  end

  def self.time_estimation
    UberRideRequest.ride_request["prices"][1]["duration"]
  end

  def self.price_estimation
    UberRideRequest.ride_request["prices"][1]["low_estimate"]
  end

  def self.ride_reminder
    event = Event.new
    body = {reminder_time: (Time.now + 5.minutes).to_i, phone_number: "+4511241342", event: event.as_json, time: event.time}
      header = {'Authorization' => 'Token vhKRfrggbm7HPxanf4RfQnXf_i3dIAD_8ISj4IyL', 'Content-Type' => 'application/json'}
    HTTParty.post("https://sandbox-api.uber.com/v1/reminders", headers: header, body: body.to_json )
  end

  def self.pick_up_time
    ride_time_in_minutes = UberRideRequest.time_estimation / 60.0
    appointment_time = DateTime.strptime(CareCloud.get_time_of_appointment)
    app_time_in_secs = (appointment_time.hour * (60 * 60)) + (appointment_time.minute * (60))
    seconds_uber_pick_up = app_time_in_secs - 900 - (ride_time_in_minutes * 60)
    app_hour = seconds_uber_pick_up.to_i / (60 * 60)
    app_min = (seconds_uber_pick_up.to_i % (60 * 60)) / 60
  end
end

class Event
  attr_accessor :time, :name
  def initialize
    @time = (Time.now + 5.minutes).to_i
    @name = "Rick James"

  end
  def as_json
    {time: @time, name: @name}
  end
  def get_eta
    #ride_id = can't get it yet :)
    header = {'Authorization' => 'Token vhKRfrggbm7HPxanf4RfQnXf_i3dIAD_8ISj4IyL', 'Content-Type' => 'application/json'}
  HTTParty.post("https://sandbox-api.uber.com//v1/requests/#{ride_id}", headers: header,
  destination.eta
  end
end
