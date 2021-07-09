class Event < ApplicationRecord
  serialize :recurrence, Montrose::Recurrence
  belongs_to :eventable, polymorphic: true
  belongs_to :creator, class_name: "User", optional: true
  belongs_to :parent, class_name: "Event", foreign_key: "parent_event_id", optional: true, inverse_of: :children
  has_many :children, class_name: "Event", foreign_key: "parent_event_id", inverse_of: :parent
end
