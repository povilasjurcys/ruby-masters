module Learning
  class TopicsController < AuthenticatedController
    expose(:course) { Topic.main.first }
    expose(:unfinished_topic) { course.subtopics.detect { |topic| !topic.finished_by?(current_user) } }

    def index; end
  end
end
