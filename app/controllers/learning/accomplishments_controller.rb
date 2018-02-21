module Learning
  class AccomplishmentsController < AuthenticatedController
    expose(:topic) { Topic.find(params[:topic_id]) }
    expose(:accomplishment, scope: -> { topic.accomplishments })

    def create
      topic.accomplishments.create!(accomplishment_params)

      if topic.parent_topic.finished_by?(current_user)
        redirect_to learning_topics_path
      else
        redirect_back(fallback_location: root_url)
      end
    end

    def update
      topic.accomplishments
           .find_by(user_id: current_user)
           .update!(accomplishment_params)

      redirect_back(fallback_location: root_url)
    end

    private

    def accomplishment_params
      { user_id: current_user.id, status: params[:status] }
    end
  end
end
