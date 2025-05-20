class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :audiences

  ROLES = %w[guest employee admin]

  validates :role, inclusion: { in: ROLES }
end
