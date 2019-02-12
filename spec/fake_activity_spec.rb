require 'spec_helper'

describe FakeActivity::ActivityGenerator do
  describe '#generate_activity' do
    before do
      allow_any_instance_of(IO).to receive(:puts).and_return nil
    end

    context 'when we have only one day' do
      let(:date) { '21 Apr 2009' }

      before do
        allow(FakeActivity::CommitGenerator).to receive(:generate_commits).and_return(nil)
        described_class.generate_activity(from: date, to: date)
      end

      it 'calls function 1 time' do
        expect(FakeActivity::CommitGenerator).to have_received(:generate_commits).exactly(1).times
      end
    end

    context 'when date range is equal to 10' do
      let(:from) { '1 Apr 2009' }
      let(:to)   { '10 Apr 2009' }

      before do
        allow(FakeActivity::CommitGenerator).to receive(:generate_commits).and_return(nil)
        described_class.generate_activity(from: from, to: to)
      end

      it 'calls function 10 time' do
        expect(FakeActivity::CommitGenerator).to have_received(:generate_commits).exactly(10).times
      end
    end

    context 'when date has reverse order' do
      let(:from) { '10 Apr 2009' }
      let(:to)   { '1 Apr 2009' }

      before do
        allow(FakeActivity::CommitGenerator).to receive(:generate_commits).and_return(nil)
        described_class.generate_activity(from: from, to: to)
      end

      it 'does not call function' do
        expect(FakeActivity::CommitGenerator).to have_received(:generate_commits).exactly(0).times
      end
    end
  end
end
