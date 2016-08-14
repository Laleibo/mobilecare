class AddReqIdToRides < ActiveRecord::Migration[5.0]
  def change
    add_column :rides, :request_id, :int
  end
end
