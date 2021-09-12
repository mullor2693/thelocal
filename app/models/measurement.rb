class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  
  validates :evaluation_date, presence: true
end
