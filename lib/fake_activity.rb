require 'date'
require "fake_activity/version"

module FakeActivity
  class ActivityGenerator
    attr_reader :from, :to, :temp_file_name

    def self.generate_activity(from:, to:)
      new(from: from, to: to).generate_activity
    end

    def initialize(from:, to:)
      @from               = Date.parse(from)
      @to                 = Date.parse(to)
      @temp_file_name     = 'temp.txt'
    end

    def generate_activity
      iterate_by_days
    end

    private

    def iterate_by_days
      (from..to).each do |date_point|
        add_dark_green_activity(date_point.to_s)
      end
    end


    def add_light_green_activity(date_point)
      1.times { add_commit(date_point) }
    end

    def add_moderate_green_activity(date_point)
      6.times { add_commit(date_point) }
    end

    def add_green_activity(date_point)
      8.times { add_commit(date_point) }
    end

    def add_dark_green_activity(date_point)
      10.times { add_commit(date_point) }
    end


    def add_commit(date_point)
      `git commit -m "temp" --allow-empty --date=#{date_point}`
    end
  end
end
