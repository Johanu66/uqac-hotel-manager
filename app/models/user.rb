class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :name, presence: true, length: { maximum: 100 }
  validates :role, presence: true, inclusion: { in: %w[admin receptionist client] }
end
