ActiveAdmin.register TypeChambre do
  # Specify parameters which should be permitted for assignment
  permit_params :nom, :description, :prix_par_nuit, :capacite, :nombre_total

  menu label: "Rooms Types"

  # or consider:
  #
  # permit_params do
  #   permitted = [:nom, :description, :prix_par_nuit, :capacite, :nombre_total]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :nom
  filter :description
  filter :prix_par_nuit
  filter :capacite
  filter :nombre_total
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :nom
    column :description
    column :prix_par_nuit
    column :capacite
    column :nombre_total
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :nom
      row :description
      row :prix_par_nuit
      row :capacite
      row :nombre_total
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :nom
      f.input :description
      f.input :prix_par_nuit
      f.input :capacite
      f.input :nombre_total
    end
    f.actions
  end
end
