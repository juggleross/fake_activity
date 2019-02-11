module FakeActivity
  class CommitGenerator
    TYPES_REPEAT_COUNT = {
      light_green: 1,
      moderate_green: 6,
      green: 8,
      dark_green: 10
    }

    attr_reader :date, :number_of_commits, :type

    def self.generate_commits(date)
      new(date).generate_commits
    end

    def initialize(date)
      @type              = FakeActivity::TypeDetector.detect_type
      @number_of_commits = TYPES_REPEAT_COUNT[@type]
      @date              = date.to_s
    end

    def generate_commits
      number_of_commits.times { |num| add_commit(num) }
    end

    private

    # def add_light_green_activity(date_point)
    #   1.times { add_commit(date_point) }
    # end
    #
    # def add_moderate_green_activity(date_point)
    #   6.times { add_commit(date_point) }
    # end
    #
    # def add_green_activity(date_point)
    #   8.times { add_commit(date_point) }
    # end
    #
    # def add_dark_green_activity(date_point)
    #   10.times { add_commit(date_point) }
    # end

    def add_commit(number)
      `git commit -m "#{date} - #{number}" --allow-empty --date=#{date}`
    end
  end
end
