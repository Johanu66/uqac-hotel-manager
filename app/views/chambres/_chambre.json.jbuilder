json.extract! chambre, :id, :numero, :type_chambre_id, :statut, :description, :created_at, :updated_at
json.url chambre_url(chambre, format: :json)
