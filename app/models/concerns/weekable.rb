module Weekable extend ActiveSupport::Concern

    WEEKDAYS = (1..7).collect {|weekday| [I18n.t('date.day_names')[weekday%7].capitalize, weekday ] }
    SM_WEEKDAYS = [["1","L"],["2","M"],["3","X"],["4","J"],["5","V"],["6","S"],["7","D"]]
    def name_weekday(weekday)
        I18n.t('date.day_names')[weekday.to_i%7].capitalize
    end

    def list_weekdays
        list = []
        weekdays.each do |weekday|
            list << name_weekday(weekday)
        end
        return list
    end

    def weekdays_sentence
        list_weekdays.to_sentence
    end

    private

    def clean_weekdays
        weekdays.delete("")
    end

end
