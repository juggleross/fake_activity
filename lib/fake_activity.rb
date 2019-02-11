require "fake_activity/version"

module FakeActivity
  class ActivityGenerator
    attr_reader :from, :to

    def self.generate_activity(from:, to:)
      new(from: from, to: to).generate_activity
    end

    def initialize(from:, to:)
      @from = from
      @to   = to
    end

    def generate_activity
      p 'is it working?'
      `touch 1.txt`
    end
  end
end
