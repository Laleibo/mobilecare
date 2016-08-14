class Uber < ApplicationRecord
    def self.uber_ride
      p start_lat = CareCloud.get_patient_address[0]
      p start_long = CareCloud.get_patient_address[1]
      p end_lat = CareCloud.get_office_location[0]
      p end_long = CareCloud.get_office_location[1]
      header = {'Authorization' => "Bearer #{ENV['UBER_AUTH']}"}
      HTTParty.get("https://sandbox-api.uber.com/v1/estimates/price?start_latitude=#{start_lat}&start_longitude=#{start_long}&end_latitude=#{end_lat}&end_longitude=#{end_long}", headers: header)
    end

    def self.ride_reminder
     event = Event.new
     body = {reminder_time: (Time.now + 5.minutes).to_i, phone_number: "+4511241342", event: event.as_json, time: event.time}
       header = {'Authorization' => 'Token vhKRfrggbm7HPxanf4RfQnXf_i3dIAD_8ISj4IyL', 'Content-Type' => 'application/json'}
     HTTParty.post("https://sandbox-api.uber.com/v1/reminders", headers: header, body: body.to_json )
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
  end
end
