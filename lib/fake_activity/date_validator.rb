# frozen_string_literal: true

module FakeActivity
  class DateValidator
    attr_reader :date

    def initialize(date)
      @date = date
    end

    def valid?
      date_exist? && date_valid?
    end

    def message
      "#{date} is an invalid argument" unless valid?
    end

    private

    def date_exist?
      date
    end

    def date_valid?
      Date.parse(date)
      true
    rescue ArgumentError
      false
    end
  end
end
