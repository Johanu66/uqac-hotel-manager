class Chambre < ApplicationRecord
  belongs_to :type_chambre
  has_many :reservations, dependent: :nullify

  enum :statut, { available: 0, occupied: 1, maintenance: 2 }
  validates :statut, presence: true, inclusion: { in: statuts.keys }

  validates :numero, presence: true, uniqueness: true
end
