class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :event_managers
  has_many :managed_events, through: :event_managers, source: :event
  has_many :event_assignees
  has_many :assigned_events, through: :event_assignees, source: :event


  # Callbacks

  # Validation
  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true

  # Attributes
  def nickname
    full_name.present? ? full_name : email
  end

  def full_name
    [(name.try(:strip) || ""), (surname.try(:strip) || "")].join(" ").strip
  end
end
