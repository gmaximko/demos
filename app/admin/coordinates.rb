ActiveAdmin.register Coordinate do
permit_params :email, :latitude, :longitude, :time
  
  index do
    selectable_column
    id_column
    column :email
    column :latitude
    column :longitude
    column :time
    actions
  end

   filter :email
   filter :latitude
   filter :longitude
   filter :time

  form do |f|
    f.inputs "Coordinates" do
      f.input :email
      f.input :latitude
      f.input :longitude
      f.input :time
    end
    f.actions
  end
end
