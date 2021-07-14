class Homework < ApplicationRecord
  has_many :events, as: :eventable

  # Validation
  validates :title, presence: true

  def self.weekly_events
    Event.all.group("DATE_TRUNC('day', start_date)").count
  end
end
