class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :event_managers
  has_many :managed_events, through: :event_managers, source: :event
  has_many :event_assignees
  has_many :assigned_events, through: :event_assignees, source: :event
  has_one_attached :avatar

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

  def name_initials(letters=2)
    full_name.split.map(&:first).first(letters).join
  end

  def avatar_thumbnail
    avatar.variant(resize: "150x150!").processed if avatar.attached?
  end

  def avatar_icon
    avatar.variant(resize: "40x40!").processed if avatar.attached?
  end
end
