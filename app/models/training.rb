class Training < ApplicationRecord
    include Weekable
    has_many :workouts

    def weekdays
        [] # TODO: something
    end
end
