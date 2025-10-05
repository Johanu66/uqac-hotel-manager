class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  enum :role, { client: 0, receptionist: 1, manager: 2 }
  validates :role, presence: true, inclusion: { in: roles.keys }

  validates :name, presence: true, length: { maximum: 100 }

  has_many :reservations, dependent: :destroy
end
