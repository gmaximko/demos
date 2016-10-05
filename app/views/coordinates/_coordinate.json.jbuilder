json.extract! coordinate, :id, :email, :latitude, :longitude, :time, :created_at, :updated_at
json.url coordinate_url(coordinate, format: :json)