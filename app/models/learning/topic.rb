module Learning
  # represents course topic
  class Topic < ApplicationRecord
    belongs_to :parent_topic, class_name: 'Learning::Topic', optional: true

    has_many :subtopics, class_name: 'Learning::Topic', foreign_key: :parent_topic_id, dependent: :destroy
    has_many :accomplishments

    acts_as_list scope: [:parent_topic_id]

    default_scope -> { order(:position) }
    scope :main, -> { where(parent_topic_id: nil) }

    def ancestor_topics
      ancestors = [parent_topic].compact
      ancestors << ancestors.last.parent_topic while ancestors.last&.parent_topic
      ancestors
    end

    def finished_by?(user)
      if subtopics.any?
        subtopics.all? { |topic| topic.finished_by?(user) }
      else
        accomplishments.where(user_id: user.id).exists?
      end
    end
  end
end
