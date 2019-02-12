# frozen_string_literal: true

require 'spec_helper'

describe FakeActivity::CommitGenerator do
  describe '#generate_commits' do
    let!(:commit_generator) { described_class.new('12 Mar 2012') }

    before do
      allow(commit_generator).to receive(:add_commit).and_return nil
    end

    context 'when type is :light_green' do
      before do
        allow(commit_generator).to receive(:type).and_return :light_green
        commit_generator.generate_commits
      end

      it 'calls commit_generator 1 times' do
        expect(commit_generator).to have_received(:add_commit).exactly(1).times
      end
    end

    context 'when type is :moderate_green' do
      before do
        allow(commit_generator).to receive(:type).and_return :moderate_green
        commit_generator.generate_commits
      end

      it 'calls commit_generator 6 times' do
        expect(commit_generator).to have_received(:add_commit).exactly(6).times
      end
    end

    context 'when type is :green' do
      before do
        allow(commit_generator).to receive(:type).and_return :green
        commit_generator.generate_commits
      end

      it 'calls commit_generator 8 times' do
        expect(commit_generator).to have_received(:add_commit).exactly(8).times
      end
    end

    context 'when type is :dark_green' do
      before do
        allow(commit_generator).to receive(:type).and_return :dark_green
        commit_generator.generate_commits
      end

      it 'calls commit_generator 8 times' do
        expect(commit_generator).to have_received(:add_commit).exactly(10).times
      end
    end
  end
end
