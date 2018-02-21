module Learning
  class TopicsController < AuthenticatedController
    expose(:topics) { Topic.main.first&.subtopics || [] }
  end
end
