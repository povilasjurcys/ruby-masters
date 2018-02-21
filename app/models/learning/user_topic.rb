module Learning
  class UserTopic
    # delegate :link_to, to: (ActionController::Base.helpers)
    delegate :title, :ancestor_topics, :id, to: :topic
    delegate :status, to: :accomplishment, allow_nil: true

    def initialize(topic, current_user)
      @topic = topic
      @current_user = current_user
    end

    def subtopics
      @subtopics ||= topic.subtopics.map { |it| self.class.new(it, current_user) }
    end

    def finished?
      accomplishment.present?
    end

    def skipped?
      finished? && accomplishment.skipped?
    end

    private

    attr_reader :topic, :current_user

    def accomplishment
      return @accomplishment if defined?(@accomplishment)
      @accomplishment = topic.accomplishments.find_by(user_id: current_user.id)
    end
  end
end
