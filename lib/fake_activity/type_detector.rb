module FakeActivity
  class TypeDetector
    TYPES_PROBABILITY = {
      light_green:    (1..50),
      moderate_green: (51..70),
      green:          (71..90),
      dark_green:     (91..100)
    }

    attr_reader :random_number

    def self.detect_type
      new.detect_type
    end

    def initialize
      @random_number = rand(1..100)
    end

    def detect_type
      TYPES_PROBABILITY.each { |key, value| return key if value.include? random_number }
    end
  end
end
