class TypeChambre < ApplicationRecord
  has_many :chambres, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :nom, :prix_par_nuit, :capacite, :nombre_total, presence: true
end
