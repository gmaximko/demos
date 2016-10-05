class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :email
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :time

      t.timestamps null: false
    end
  end
end
