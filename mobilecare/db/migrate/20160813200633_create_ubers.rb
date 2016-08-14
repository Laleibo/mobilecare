class CreateUbers < ActiveRecord::Migration[5.0]
  def change
    create_table :ubers do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
