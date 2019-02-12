# frozen_string_literal: true

require 'spec_helper'

describe FakeActivity::TypeDetector do
  describe '#detect_type' do
    describe 'type context' do
      let(:array_of_types) { [] }

      before do
        1000.times { array_of_types << described_class.detect_type }
      end

      it 'includes :light_green type' do
        expect(array_of_types).to include :light_green
      end

      it 'includes :moderate_green type' do
        expect(array_of_types).to include :moderate_green
      end

      it 'includes :green type' do
        expect(array_of_types).to include :green
      end

      it 'includes :dark_green type' do
        expect(array_of_types).to include :dark_green
      end
    end

    describe 'type probability' do
      let(:array_of_types) { [] }

      before do
        10_000.times { array_of_types << described_class.detect_type }
      end

      it ':light_green has 50 % probability' do
        expect(array_of_types.count(:light_green)).to be_between(4500, 5500)
      end

      it ':moderate_green has 20 % probability' do
        expect(array_of_types.count(:moderate_green)).to be_between(1500, 2500)
      end

      it ':green has 20 % probability' do
        expect(array_of_types.count(:green)).to be_between(1500, 2500)
      end

      it ':dark_green has 10 % probability' do
        expect(array_of_types.count(:dark_green)).to be_between(500, 1500)
      end
    end
  end
end
