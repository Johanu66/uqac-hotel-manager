json.extract! type_chambre, :id, :nom, :description, :prix_par_nuit, :capacite, :nombre_total, :created_at, :updated_at
json.url type_chambre_url(type_chambre, format: :json)
