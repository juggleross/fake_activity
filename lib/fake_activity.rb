require 'date'
require "fake_activity/version"

# move it outside this class letter
require "fake_activity/type_detector"
require "fake_activity/commit_generator"

module FakeActivity
  class ActivityGenerator
    attr_reader :from, :to, :temp_file_name

    def self.generate_activity(from:, to:)
      new(from: from, to: to).generate_activity
    end

    def initialize(from:, to:)
      @from = Date.parse(from)
      @to   = Date.parse(to)
    end

    def generate_activity
      iterate_by_days
    end

    private

    def iterate_by_days
      (from..to).each do |date_point|
        FakeActivity::CommitGenerator.generate_commits(date_point)
      end
    end
  end
end
