class Homework < ApplicationRecord
  has_many :events, as: :eventable

  # Validation
  validates :title, presence: true
end
