class Training < ApplicationRecord
    include Weekable
    has_many :workouts

    validates_presence_of :name

    def weekdays
        self&.workouts&.pluck(:weekdays)&.flatten&.uniq || []
    end
end
