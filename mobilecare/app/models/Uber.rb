class UberRideRequest
  CLIENT =  Uber::Client.new do |config|
      config.client_id      = ENV["UBER_CLIENT_ID"]
      config.client_secret  = ENV["UBER_CLIENT_SECRET"]
      config.server_token   = ENV["UBER_SERVER_TOKEN"]
  def self.uber_request
    header = {'Authorization' => 'Bearer Vsk0x3pTxSDnSJRds5tOyPEC5ehAx7g4'}
  HTTParty.get('https://sandbox-api.uber.com/V1'}
  end

end
