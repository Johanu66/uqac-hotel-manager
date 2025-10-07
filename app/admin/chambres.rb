ActiveAdmin.register Chambre do
  # Specify parameters which should be permitted for assignment
  permit_params :numero, :type_chambre_id, :statut, :description

  menu label: "Rooms Inventory"

  # or consider:
  #
  # permit_params do
  #   permitted = [:numero, :type_chambre_id, :statut, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :numero
  filter :type_chambre
  filter :statut
  filter :description
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :numero
    column :type_chambre
    column :statut
    column :description
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :numero
      row :type_chambre
      row :statut
      row :description
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :numero
      f.input :type_chambre
      f.input :statut
      f.input :description
    end
    f.actions
  end
end
