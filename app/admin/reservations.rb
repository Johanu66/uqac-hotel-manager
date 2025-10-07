ActiveAdmin.register Reservation do
  # Specify parameters which should be permitted for assignment
  permit_params :user_id, :type_chambre_id, :chambre_id, :date_arrivee, :date_depart, :statut, :prix_total, :date_creation

  menu label: "Reservations"

  # or consider:
  #
  # permit_params do
  #   permitted = [:user_id, :type_chambre_id, :chambre_id, :date_arrivee, :date_depart, :statut, :prix_total, :date_creation]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :user
  filter :type_chambre
  filter :chambre
  filter :date_arrivee
  filter :date_depart
  filter :statut
  filter :prix_total
  filter :date_creation
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :user
    column :type_chambre
    column :chambre
    column :date_arrivee
    column :date_depart
    column :statut
    column :prix_total
    column :date_creation
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :user
      row :type_chambre
      row :chambre
      row :date_arrivee
      row :date_depart
      row :statut
      row :prix_total
      row :date_creation
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :user
      f.input :type_chambre
      f.input :chambre
      f.input :date_arrivee
      f.input :date_depart
      f.input :statut
      f.input :prix_total
      f.input :date_creation
    end
    f.actions
  end
end
