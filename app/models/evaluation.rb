class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  
  validates :evaluation_date, presence: true

  EVALUABLE_ATTRIBUTES = Evaluation.attribute_names - ["id", "evaluation_date", "user_id", "created_at", "updated_at", "creator_id"]

  
  
end
