class CreateCareClouds < ActiveRecord::Migration[5.0]
  def change
    create_table :care_clouds do |t|

      t.timestamps
    end
  end
end
