module Learning
  class TopicsController < AuthenticatedController
    expose(:course) { Topic.main.first }
    expose(:topic) { UserTopic.new(Topic.find(params[:id]), current_user) }

    def index
      return if course.nil? || course.finished_by?(current_user)
      redirect_to learning_topic_path(unfinished_topic)
    end

    def show; end

    private

    def unfinished_topic
      unfinished_lowest_topic = course.subtopics.detect { |topic| !topic.finished_by?(current_user) }

      while unfinished_lowest_topic.subtopics.exists?
        unfinished_lowest_topic = unfinished_lowest_topic.subtopics.detect do |topic|
          !topic.finished_by?(current_user)
        end
      end

      unfinished_lowest_topic.parent_topic
    end
  end
end
