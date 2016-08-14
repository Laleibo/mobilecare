class CareCloud < ApplicationRecord
  def self.get_appointment
    header = {'Authorization' => 'Bearer Vsk0x3pTxSDnSJRds5tOyPEC5ehAx7g4'}
     appointment = HTTParty.get('https://external-api-gateway.development.carecloud.com/v2/appointments?start_date=20160801&end_date=20160830', headers: header)
  end
  def self.get_appointment_id
      CareCloud.get_appointment[0]["appointment"]["id"]
  end
  def self.get_patient_id
    CareCloud.get_appointment[0]["appointment"]["patient"]["id"]
  end
  def self.get_patient
    patient_id = CareCloud.get_patient_id
    header = {'Authorization' => 'Bearer Vsk0x3pTxSDnSJRds5tOyPEC5ehAx7g4'}
     appointment = HTTParty.get('https://external-api-gateway.development.carecloud.com/v2/patients/' + patient_id, headers: header)
  end
  def self.get_patient_address
    CareCloud.get_patient["patient"]["addresses"].each do |address|
      if address["is_primary"] == true
        @street_address = address["line1"]
        @city = address["city"]
        @state = address["state"]
      end
    end
    Geocoder.coordinates(@street_address + @city + @state)
  end

  def self.get_time_of_appointment
    CareCloud.get_appointment[0]["appointment"]["start_time"]
  end

  def self.get_office_location
    header = {'Authorization' => 'Bearer Vsk0x3pTxSDnSJRds5tOyPEC5ehAx7g4'}
    location_id = CareCloud.get_appointment[0]["appointment"]["location"]["id"]
    locations = HTTParty.get('https://external-api-gateway.development.carecloud.com/v2/locations', headers: header)["locations"]
    locations.each do |location|
      if location["id"] = location_id
        @office_street_address = location["address"]["line1"]
        @office_street_city = location["address"]["city"]
        @office_state = location["address"]["state_name"]
      end
    end
      Geocoder.coordinates(@office_street_address + @office_street_city + @office_state)
  end
end
