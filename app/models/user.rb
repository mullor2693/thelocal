class User < ApplicationRecord
  # Includes
  rolify
  devise :database_authenticatable, :recoverable, :validatable, :trackable
  include Imageable

  # Associations
  has_many :user_workouts
  has_many :workouts, through: :user_workouts
  has_many :weights, -> { order(evaluation_date: :desc) }
  has_many :measurements
  has_many :evaluations, inverse_of: :user
  has_many :user_diets
  has_many :diets, through: :user_diets
  has_one_attached :avatar
  # Associations 2
  has_many :event_managers
  has_many :managed_events, through: :event_managers, source: :event
  has_many :event_assignees
  has_many :assigned_events, through: :event_assignees, source: :event

 

  # Callbacks
  # before_save :set_default_avatar

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

  def last_weight
    weights.present? ? weights.first : nil
  end

  def track_info
    { id: id, email: email }
  end

  def get_evaluable_info(info=[])
    uevs = self.evaluations.order(evaluation_date: :desc)
    info = Evaluation::EVALUABLE_ATTRIBUTES-(Evaluation::EVALUABLE_ATTRIBUTES-info)
    r_arr = []
    info.each do |ev|
      r_hash = {}
      uevs.each do |uev|
        r_hash[uev.evaluation_date.to_date] = uev[ev]
      end
      r_arr << {name: ev.humanize, data: r_hash}
    end
    return r_arr
  end

  def get_evaluable_info_with_future(info=[], n_reps=2)
    uevs = self.evaluations.order(evaluation_date: :desc)
    info = Evaluation::EVALUABLE_ATTRIBUTES-(Evaluation::EVALUABLE_ATTRIBUTES-info)
    r_arr = []
    info.each do |ev|
      r_hash = {}
      uevs.each do |uev|
        r_hash[uev.evaluation_date.to_date] = uev[ev]
      end
      if uevs.count > 1
        uev_last = uevs.first
        uev_bf_last = uevs.second
        date_diff = (uev_last.evaluation_date - uev_bf_last.evaluation_date)
        value_diff = (uev_last[ev]||0) - (uev_bf_last[ev]||0)
        future_value = uev_last[ev].present? ? uev_last[ev] + value_diff : nil
        (1..n_reps).each do |step|
          future_date = uev_last.evaluation_date + step*date_diff
          future_value = future_value.present? ? future_value + value_diff : nil
          r_hash[future_date.to_date] = future_value
        end
      end
      r_arr << {name: ev.humanize, data: (r_hash.empty? ? {Date.today.to_date=>nil} : r_hash) }
    end
    return r_arr
  end

 
  # Object Methods
  def avatar_sized(size)
      avatar.variant(Imageable.sizes[size]).processed
  end


  # Class Methods
  def self.html_from_track_info(info)
    user = User.find(info["id"])
    if( user.present? )
      "<a class='user-link' href='#{admin_user_path(user.id)}'><span class='user-pill'>#{image_pack_tag(user.avatar)}<b>#{user.name}</b></span></a>".html_safe
    else
      info["email"].html_safe
    end
  end

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

  private 

  def set_default_avatar
    self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'users', 'avatar.png')), filename: 'avatar.png', content_type: 'image/png') unless self.avatar.attached? 
  end

end
