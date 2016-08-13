class AddInfoToRide < ActiveRecord::Migration[5.0]
  def change
    add_column :rides, :wants_ride, :boolean
    add_column :rides, :confirm_ride, :boolean
    add_column :rides, :cancel_ride, :boolean
    add_column :rides, :lattitude, :float
    add_column :rides, :longitude, :float
    add_column :rides, :pick_up_time, :string
    add_column :rides, :eta, :string
    add_column :rides, :note_to_driver, :text
    add_column :rides, :return_ride, :boolean
  end
end
