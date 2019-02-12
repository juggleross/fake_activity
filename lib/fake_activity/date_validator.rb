module FakeActivity
  class DateValidator
    attr_reader :date

    def initialize(date)
      @date = date
    end

    def valid?
      @valid ||= check_date
    end

    def message
      "#{date} is an invalid argument" unless valid?
    end

    private

    def check_date
      begin
        Date.parse(date)
        true
      rescue ArgumentError
        false
      end
    end
  end
end
