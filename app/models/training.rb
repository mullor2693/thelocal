class Training < ApplicationRecord
    include Weekable
    has_many :workouts

    validates_presence_of :name

    def weekdays
        [] # TODO: something
    end
end
