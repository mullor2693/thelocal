class Event < ApplicationRecord
  serialize :recurrence, Montrose::Recurrence
  belongs_to :eventable, polymorphic: true
  belongs_to :creator, class_name: "User", optional: true
  belongs_to :parent, class_name: "Event", foreign_key: "parent_event_id", optional: true, inverse_of: :children
  has_many :children, class_name: "Event", foreign_key: "parent_event_id", inverse_of: :parent
  has_many :event_managers
  has_many :managers, through: :event_managers, source: :user
  has_many :event_assignees
  has_many :assignees, through: :event_assignees, source: :user

  
  scope :related_to_users, -> (users) { where(creator: users) || joins(:event_managers).where(event_managers: {user: users})  || joins(:event_assignees).where(event_assignees: {user: users})}

  def self.report_week(events=nil)
    wday_hash = {}
    wday_counters = (events || self.all).group_by { |x| x&.start_date&.wday }.sort.map { |wday, record| [ApplicationHelper::WEEK_DAYS[wday-1], record.map(&:start_date).map(&:wday).reduce(:+).to_s] }.to_h
    ApplicationHelper::WEEK_DAYS.each do |wday|
      wday_hash[wday] = wday_counters[wday] || "0" 
    end
    wday_hash
  end

end
