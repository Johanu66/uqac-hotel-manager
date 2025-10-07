class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :name, presence: true, length: { maximum: 100 }

  has_many :reservations, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name email role created_at updated_at sign_in_count current_sign_in_at last_sign_in_at current_sign_in_ip last_sign_in_ip confirmed_at confirmation_sent_at unconfirmed_email failed_attempts locked_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def to_s
    "#{name} (#{email})"
  end

  def display_name
    to_s
  end
end
