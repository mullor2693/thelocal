class Homework < ApplicationRecord
  has_many :events, as: :eventable
end
