class Room < ApplicationRecord
  has_many :homework_rooms
  has_many :homeworks, through: :homework_rooms

  # Validation
  validates :name, presence: true
end
