module Imageable extend ActiveSupport::Concern

    def self.sizes
    { 
        tiny: { resize: "35x35" },
        small: { resize: "50x50" },
        thumb: { resize: "75x75" },
        normal: { resize: "100x100" },
        big: { resize: "200x200" }
    }
    end

end
