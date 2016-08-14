class UberRideRequest
  CLIENT =  Uber::Client.new do |config|
      config.client_id      = ENV["UBER_CLIENT_ID"]
      config.client_secret  = ENV["UBER_CLIENT_SECRET"]
      config.server_token   = ENV["UBER_SERVER_TOKEN"]
  end

  

end
