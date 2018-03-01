require 'rails_helper'

RSpec.describe Learning::Topic do
  subject(:topic) { described_class.new }

  describe '#leaf_topics' do
    subject(:leaf_topics) { topic.leaf_topics }

    context 'when topic does not have any subtopics' do
      it { is_expected.to be_empty }
    end

    context 'when topic has various depth subtopics' do
      before do
        topic.subtopics.build(title: 'leaf subtopic')

        subtopic = topic.subtopics.build(title: 'subtopic')
        subtopic.subtopics.build(title: 'leaf_subsubtopic 1')
        subtopic.subtopics.build(title: 'leaf_subsubtopic 2')
      end

      it 'returns only deepest topics' do
        titles = leaf_topics.map(&:title)
        expect(titles).to eq ['leaf subtopic', 'leaf_subsubtopic 1', 'leaf_subsubtopic 2']
      end
    end
  end
end
