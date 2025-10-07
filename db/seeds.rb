# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(name: "John Doe", email: 'manager1@example.com', role: 'manager', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(name: "Jane Smith", email: 'receptionist1@example.com', role: 'receptionist', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(name: "Alice Johnson", email: 'manager2@example.com', role: 'manager', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(name: "Bob Brown", email: 'receptionist2@example.com', role: 'receptionist', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Seed TypeChambre
type_chambres = [
    { nom: "Simple", description: "Chambre simple pour 1 personne", prix_par_nuit: 75, capacite: 1, nombre_total: 10 },
    { nom: "Double", description: "Chambre double pour 2 personnes", prix_par_nuit: 120, capacite: 2, nombre_total: 15 },
    { nom: "Suite", description: "Suite luxueuse", prix_par_nuit: 250, capacite: 4, nombre_total: 5 }
]
type_chambres.each do |attrs|
    TypeChambre.find_or_create_by!(nom: attrs[:nom]) do |tc|
        tc.description = attrs[:description]
        tc.prix_par_nuit = attrs[:prix_par_nuit]
        tc.capacite = attrs[:capacite]
        tc.nombre_total = attrs[:nombre_total]
    end
end

# Seed Chambres
chambres = [
    { numero: "101", type_chambre: TypeChambre.find_by(nom: "Simple"), statut: 0, description: "Vue sur le lac" },
    { numero: "102", type_chambre: TypeChambre.find_by(nom: "Double"), statut: 0, description: "Proche de l'ascenseur" },
    { numero: "201", type_chambre: TypeChambre.find_by(nom: "Suite"), statut: 0, description: "Grande suite avec balcon" },
    { numero: "202", type_chambre: TypeChambre.find_by(nom: "Double"), statut: 2, description: "En rénovation" },
    { numero: "103", type_chambre: TypeChambre.find_by(nom: "Simple"), statut: 1, description: "Occupée par un client" },
    { numero: "203", type_chambre: TypeChambre.find_by(nom: "Suite"), statut: 0, description: "Suite présidentielle" },
    { numero: "104", type_chambre: TypeChambre.find_by(nom: "Simple"), statut: 0, description: "Chambre calme" },
    { numero: "105", type_chambre: TypeChambre.find_by(nom: "Double"), statut: 0, description: "Chambre avec vue sur la ville" }

]
chambres.each do |attrs|
    Chambre.find_or_create_by!(numero: attrs[:numero]) do |chambre|
        chambre.type_chambre = attrs[:type_chambre]
        chambre.statut = attrs[:statut]
        chambre.description = attrs[:description]
    end
end

# Seed Users
users = [
    { name: "Jean Dupont", email: "jean.dupont@example.com", password: "password" },
    { name: "Marie Lefebvre", email: "marie.lefebvre@example.com", password: "password" },
    { name: "Pierre Martin", email: "pierre.martin@example.com", password: "password" },
    { name: "Sophie Bernard", email: "sophie.bernard@example.com", password: "password" },
    { name: "Lucie Dubois", email: "lucie.dubois@example.com", password: "password" }
]
users.each do |attrs|
    User.find_or_create_by!(email: attrs[:email]) do |user|
        user.name = attrs[:name]
        user.password = attrs[:password]
        user.confirmed_at = Time.now
    end
end

# Seed Reservations
reservations = [
    {
        user: User.find_by(email: "jean.dupont@example.com"),
        type_chambre: TypeChambre.find_by(nom: "Simple"),
        chambre: Chambre.find_by(numero: "101"),
        date_arrivee: Date.today,
        date_depart: Date.today + 2,
        statut: 0,
        prix_total: 150,
        date_creation: DateTime.now
    },
    {
        user: User.find_by(email: "marie.lefebvre@example.com"),
        type_chambre: TypeChambre.find_by(nom: "Suite"),
        chambre: Chambre.find_by(numero: "201"),
        date_arrivee: Date.today + 1,
        date_depart: Date.today + 4,
        statut: 0,
        prix_total: 750,
        date_creation: DateTime.now
    },
    {
        user: User.find_by(email: "lucie.dubois@example.com"),
        type_chambre: TypeChambre.find_by(nom: "Double"),
        chambre: Chambre.find_by(numero: "105"),
        date_arrivee: Date.today + 2,
        date_depart: Date.today + 5,
        statut: 0,
        prix_total: 600,
        date_creation: DateTime.now
    }
]
reservations.each do |attrs|
    Reservation.find_or_create_by!(
        user: attrs[:user],
        type_chambre: attrs[:type_chambre],
        chambre: attrs[:chambre],
        date_arrivee: attrs[:date_arrivee],
        date_depart: attrs[:date_depart]
    ) do |reservation|
        reservation.statut = attrs[:statut]
        reservation.prix_total = attrs[:prix_total]
        reservation.date_creation = attrs[:date_creation]
    end
end