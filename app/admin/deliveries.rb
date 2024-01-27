ActiveAdmin.register Delivery do
  permit_params :name, :surname, :lastname, :phone, :email, :weight, :length, :width, :height, :price, :distance, :departure_point, :destination

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :lastname
    column :phone
    column :email
    column :weight
    column :length
    column :width
    column :height
    column :price
    column :distance
    column :departure_point
    column :destination
    column :created_at
    actions
  end

  filter :name
  filter :surname
  filter :lastname
  filter :phone
  filter :email
  filter :weight
  filter :length
  filter :width
  filter :height
  filter :price
  filter :distance
  filter :departure_point
  filter :destination
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :surname
      f.input :lastname
      f.input :phone
      f.input :email
      f.input :weight
      f.input :length
      f.input :width
      f.input :height
      f.input :price
      f.input :distance
      f.input :departure_point
      f.input :destination
    end
    f.actions
  end
  
end
