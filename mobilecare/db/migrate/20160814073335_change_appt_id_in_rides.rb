class ChangeApptIdInRides < ActiveRecord::Migration[5.0]
  def change
    change_column :rides, :appointment_id, :string
    change_column :rides, :request_id, :string
  end
end
