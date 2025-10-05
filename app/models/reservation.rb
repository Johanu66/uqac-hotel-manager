class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :type_chambre
  belongs_to :chambre, optional: true

  enum :statut, { pending: 0, confirmed: 1, cancelled: 2, completed: 3 }
  validates :statut, presence: true, inclusion: { in: statuts.keys }

  validates :date_arrivee, :date_depart, :prix_total, presence: true
  validate :date_depart_apres_date_arrivee

  def date_depart_apres_date_arrivee
    return if date_arrivee.blank? || date_depart.blank?
    if date_depart <= date_arrivee
      errors.add(:date_depart, "doit être après la date d'arrivée")
    end
  end
end
