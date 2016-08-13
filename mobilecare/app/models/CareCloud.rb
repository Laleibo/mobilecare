class CareCloud < ApplicationRecord
     def self. get_appointment
       header = {'Authorization' => 'Bearer Vsk0x3pTxSDnSJRds5tOyPEC5ehAx7g4'}
        appointment = HTTParty.get('https://external-api-gateway.development.carecloud.com/v2/appointments?start_date=20160801&end_date=20160830', headers: header)
     end

     def self.get_lattitude
       location_id = get_appointment.map(&:appointment).map(&:id)
     end

     def self.get_longitude
       appointment = get_appointment
  end
end
