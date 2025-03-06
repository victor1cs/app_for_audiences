class Audience < ApplicationRecord
  belongs_to :user, optional: true
  validates :user, presence: false
end
