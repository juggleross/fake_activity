# frozen_string_literal: true

require 'spec_helper'

describe FakeActivity::DateValidator do
  describe '#valid?' do
    context 'when date is valid' do
      let(:date) { '12 Mar 1997' }
      let(:validator) { described_class.new(date) }

      it 'is valid' do
        expect(validator.valid?).to be true
      end
    end

    context 'when date is invalid' do
      let(:date) { 'Hello' }
      let(:validator) { described_class.new(date) }

      it 'is invalid' do
        expect(validator.valid?).to be false
      end
    end

    context 'when date argument is empty' do
      let(:date) { nil }
      let(:validator) { described_class.new(date) }

      it 'is invalid' do
        expect(validator.valid?).to be_falsey
      end
    end
  end

  describe '#message' do
    context 'when date is valid' do
      let(:date) { '12 Mar 1997' }
      let(:validator) { described_class.new(date) }

      it 'is empty' do
        expect(validator.message).to eq nil
      end
    end

    context 'when date is invalid' do
      let(:date) { 'Hello' }
      let(:validator) { described_class.new(date) }

      it 'is invalid' do
        expect(validator.message).to eq "#{date} is an invalid argument"
      end
    end
  end
end
