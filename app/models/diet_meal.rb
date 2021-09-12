class DietMeal < ApplicationRecord
  include Daytimeable

  belongs_to :diet
  belongs_to :meal

  accepts_nested_attributes_for :meal

  validates :daytime, presence: true
  
  scope :by_daytime, -> (daytime_id) { where(daytime: daytime_id) || joins(:meal).where(:meals => {:daytime => daytime_id}) }

end
