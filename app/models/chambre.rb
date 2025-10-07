class Chambre < ApplicationRecord
  belongs_to :type_chambre
  has_many :reservations, dependent: :nullify

  enum :statut, { available: 0, occupied: 1, maintenance: 2 }
  validates :statut, presence: true, inclusion: { in: statuts.keys }

  validates :numero, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id type_chambre_id description numero statut created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[type_chambre reservations]
  end

  def to_s
    "Room ##{numero} (#{type_chambre.nom})"
  end

  def display_name
    to_s
  end
end
