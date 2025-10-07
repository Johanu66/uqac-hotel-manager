class TypeChambre < ApplicationRecord
  has_many :chambres, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :nom, :prix_par_nuit, :capacite, :nombre_total, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id nom prix_par_nuit description capacite nombre_total created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def to_s
    "#{nom} (#{prix_par_nuit})"
  end

  def display_name
    to_s
  end
end
