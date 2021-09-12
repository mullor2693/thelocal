module Daytimeable extend ActiveSupport::Concern

    DAYTIMES = ["Desayuno", "Aperitivo", "Almuerzo", "Comida", "Merienda", "Cena", "Tentempié"].freeze

    def name_daytime
        daytime.present? && (0..(Daytimeable::DAYTIMES.count-1)).include?(daytime)? (Daytimeable::DAYTIMES[daytime.to_i] || "") : ""
    end

    def self.daytimes_index
        Daytimeable::DAYTIMES.collect.with_index.to_a
    end
    
end
