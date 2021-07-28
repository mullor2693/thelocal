class HomeworkRoom < ApplicationRecord
  belongs_to :homework
  belongs_to :room
end
