class UberRideRequest < ApplicationRecord

  def self.time_estimation
    UberRideRequest.ride_request["prices"][1]["duration"]
  end

  def self.price_estimation
    UberRideRequest.ride_request["prices"][1]["low_estimate"]
  end

  def self.create_ride
    start_lat = CareCloud.get_patient_address[0]
    start_long = CareCloud.get_patient_address[1]
    end_lat = CareCloud.get_office_location[0]
    end_long = CareCloud.get_office_location[1]
    header = {'Authorization' => "Bearer #{ENV['UBER_AUTH']}"}
    body = {"scope" => "request"}
    HTTParty.post("https://sandbox-api.uber.com/v1/requests", headers: header, body: body.to_json)
  end

  def self.ride_request
    start_lat = CareCloud.get_patient_address[0]
    start_long = CareCloud.get_patient_address[1]
    end_lat = CareCloud.get_office_location[0]
    end_long = CareCloud.get_office_location[1]
    header = {'Authorization' => "Bearer #{ENV['UBER_AUTH']}"}
    HTTParty.get("https://sandbox-api.uber.com/v1/estimates/price?start_latitude=#{start_lat}&start_longitude=#{start_long}&end_latitude=#{end_lat}&end_longitude=#{end_long}", headers: header, body: body.to_json)
    end
    def self.pick_up_time
      ride_time_in_minutes = UberRideRequest.time_estimation / 60.0
      appointment_time = DateTime.strptime(CareCloud.get_time_of_appointment)
      app_time_in_secs = (appointment_time.hour * (60 * 60)) + (appointment_time.minute * (60))
      seconds_uber_pick_up = app_time_in_secs - 900 - (ride_time_in_minutes * 60)
      app_hour = seconds_uber_pick_up.to_i / (60 * 60)
      app_min = (seconds_uber_pick_up.to_i % (60 * 60)) / 60
    end
    def self.lyft_ride
      start_lat = CareCloud.get_patient_address[0]
      start_long = CareCloud.get_patient_address[1]
      end_lat = CareCloud.get_office_location[0]
      end_long = CareCloud.get_office_location[1]
      body = {"ride_type" => "lyft", "origin" => {"lat" => start_lat, "lng" => start_long }, "destination" => {"lat" => end_lat, "lng" => end_long} }
      header = {'Authorization' => ' Bearer SANDBOX-gAAAAABXsFatBDofKkj4i6p8UjtkUCx7R2_nVBxDSSoqzejOQaUVvkTplQH0q9shIjq356aiow0NZhOo8IUiWGEDANuY31ujxryBxE8d7e-7LyhmHY-HWHxKYz_LZbFBjpms1iPqG33lbY2dxfuiEee9tmnXhHet8H57Y8bvVXLvxgG6K_Ig96gDGeijiLWps2mFiHLOU0MBgjg9Gs5I0sUfGH8HL7Bkt_a4PHUTYenpRhDR5bCGcgxLTCz3rr8ePUO92f5uNgYX', 'Content-Type' => 'application/json'}
      HTTParty.post("https://api.lyft.com/v1/rides", headers: header, body: body.to_json )
    end
    def self.simulate_driver_arrived
      ride_id = UberRideRequest.simluate_driver_accepted["ride_id"]
      body = {"status" => "arrived"}
      header = {'Authorization' => ' Bearer SANDBOX-gAAAAABXsFatBDofKkj4i6p8UjtkUCx7R2_nVBxDSSoqzejOQaUVvkTplQH0q9shIjq356aiow0NZhOo8IUiWGEDANuY31ujxryBxE8d7e-7LyhmHY-HWHxKYz_LZbFBjpms1iPqG33lbY2dxfuiEee9tmnXhHet8H57Y8bvVXLvxgG6K_Ig96gDGeijiLWps2mFiHLOU0MBgjg9Gs5I0sUfGH8HL7Bkt_a4PHUTYenpRhDR5bCGcgxLTCz3rr8ePUO92f5uNgYX'}

      HTTParty.put("https://api.lyft.com/v1/sandbox/rides/" + ride_id, headers: header, body: body)
    end
    def self.simulate_driver_accepted
      ride_id = UberRideRequest.lyft_ride["ride_id"]
      body = {"status" => "accepted"}
      header = {'Authorization' => ' Bearer SANDBOX-gAAAAABXsFatBDofKkj4i6p8UjtkUCx7R2_nVBxDSSoqzejOQaUVvkTplQH0q9shIjq356aiow0NZhOo8IUiWGEDANuY31ujxryBxE8d7e-7LyhmHY-HWHxKYz_LZbFBjpms1iPqG33lbY2dxfuiEee9tmnXhHet8H57Y8bvVXLvxgG6K_Ig96gDGeijiLWps2mFiHLOU0MBgjg9Gs5I0sUfGH8HL7Bkt_a4PHUTYenpRhDR5bCGcgxLTCz3rr8ePUO92f5uNgYX'}

      HTTParty.put("https://api.lyft.com/v1/sandbox/rides/" + ride_id, headers: header, body: body)
    end
  def self.get_status
    body = {"status" => "accepted"}
    header = {'Authorization' => ' Bearer SANDBOX-gAAAAABXsFatBDofKkj4i6p8UjtkUCx7R2_nVBxDSSoqzejOQaUVvkTplQH0q9shIjq356aiow0NZhOo8IUiWGEDANuY31ujxryBxE8d7e-7LyhmHY-HWHxKYz_LZbFBjpms1iPqG33lbY2dxfuiEee9tmnXhHet8H57Y8bvVXLvxgG6K_Ig96gDGeijiLWps2mFiHLOU0MBgjg9Gs5I0sUfGH8HL7Bkt_a4PHUTYenpRhDR5bCGcgxLTCz3rr8ePUO92f5uNgYX'}
    HTTParty.put("https://api.lyft.com/v1/sandbox/rides/" + ride_id, headers: header, body: body)
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

end

# curl --include -X POST -u 'sUy_984mrKth:SANDBOX-_D-v3z2dsDmFVl61HKIRSj5IJ0r-1Xn2' -H 'Content-Type: application/json;charset=UTF-8' --data '{"grant_type": "client_credentials", "expires_in": 100000000000, "scope": "rides.request"}' 'https://api.lyft.com/oauth/token'
