ActiveAdmin.register Coordinate do
  permit_params :user_id, :latitude, :longitude

  index do
    selectable_column
    id_column
    column :user_id
    column :latitude
    column :longitude
    actions
  end

  filter :user_id
  filter :latitude
  filter :longitude

  form do |f|
    f.inputs 'Coordinates' do
      f.input :user_id
      f.input :latitude
      f.input :longitude
    end
    f.actions
  end
end
