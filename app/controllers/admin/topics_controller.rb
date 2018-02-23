module Admin
  class TopicsController < AdministrationController
    expose(:topics) { Learning::Topic.main }
    expose(:topic, model: 'Learning::Topic')
    expose(:parent_topic) { Learning::Topic.find_by(id: params[:parent_topic_id]) }
    expose(:parent_topic_id) { params[:parent_topic_id] }

    def index; end

    def show; end

    def create
      if topic.update(topic_params)
        flash[:success] = t('.success')
        redirect_to action: :index
      else
        render :new
      end
    end

    def update
      if topic.update(edit_topic_params)
        flash[:success] = t('.success')
        redirect_to action: :index
      else
        render :edit
      end
    end

    def destroy
      topic.destroy
      flash[:success] = t('.success')
      redirect_to action: :index
    end

    private

    def edit_topic_params
      params.require(:learning_topic).permit(:title)
    end

    def topic_params
      params.require(:learning_topic).permit(:title, :parent_topic_id)
    end
  end
end
