ActiveAdmin.register User do

index do
    selectable_column
    id_column
    column :email
    column :name
    column :created_at
    actions
  end	


end
