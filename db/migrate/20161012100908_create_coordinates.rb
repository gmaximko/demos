class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :user_id, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.timestamps null: false
    end
  end
end
