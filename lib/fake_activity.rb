require 'date'
require 'fake_activity/version'
require 'fake_activity/commit_generator'

module FakeActivity
  class ActivityGenerator
    attr_reader :from, :to

    def self.generate_activity(from:, to:)
      new(from: from, to: to).generate_activity
    end

    def initialize(from:, to:)
      @from = Date.parse(from)
      @to   = Date.parse(to)
    end

    def generate_activity
      generate_commits_by_days
      send_successfull_message
    end

    private

    def generate_commits_by_days
      (from..to).each do |date_point|
        FakeActivity::CommitGenerator.generate_commits(date_point)
      end
    end

    def send_successfull_message
      puts "Fake activities were successfully generated from #{from} to #{to}"
      puts "You can push it to github right now: $ 'git push origin master'"
    end
  end
end
