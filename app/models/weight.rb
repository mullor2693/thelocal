class Weight < ApplicationRecord
  belongs_to :user

  validates :score, :evaluation_date, presence: true
end
