json.extract! reservation, :id, :user_id, :type_chambre_id, :chambre_id, :date_arrivee, :date_depart, :statut, :prix_total, :date_creation, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
