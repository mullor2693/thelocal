module Taggable extend ActiveSupport::Concern

    def self.category_list
        self.all.map(&:category_list).flatten.uniq
    end

    def self.involved_muscle_list
        self.all.map(&:involved_muscle_list).flatten.uniq
    end

    def self.involved_equipment_list
        self.all.map(&:involved_equipment_list).flatten.uniq
    end
    
    
end
