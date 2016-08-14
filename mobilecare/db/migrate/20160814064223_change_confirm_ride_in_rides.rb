class ChangeConfirmRideInRides < ActiveRecord::Migration[5.0]
  def change
    change_column_null :rides, :confirm_ride, true
    change_column_null :rides, :cancel_ride, true
    change_column_null :rides, :request_id, true
    change_column_null :rides, :pick_up_time, true
    change_column_null :rides, :eta, true
    change_column_null :rides, :note_to_driver, true
    change_column_null :rides, :return_ride, true
  end
end
