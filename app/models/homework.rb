class Homework < ApplicationRecord
  has_many :events, as: :eventable

  accepts_nested_attributes_for :events, allow_destroy: true #, reject_if: :all_blank
  
  # Validation
  validates :title, :description, presence: true
  validates :title, length: { maximum: 50 }
  validates :title, uniqueness: true
  #after_create_commit { broadcast_append_to "homeworks" }

  scope :with_events, -> { where(id: Event.where(eventable_type: "Homework").pluck(:eventable_id).uniq) }
  scope :with_user_events, -> (user) { where(id: Event.where(eventable_type: "Homework").related_to_users(user).pluck(:eventable_id).uniq) }


  def self.weekly_events
    Event.all.group("DATE_TRUNC('day', start_date)").count
  end

end
