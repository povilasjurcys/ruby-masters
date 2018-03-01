module Admin
  class UsersController < AdministrationController
    expose(:user, scope: -> { users })
    expose(:finished_topics) do
      course.leaf_topics & users_accomplishments.map(&:topic)
    end

    expose(:course) { Learning::Topic.main.first }

    def index; end

    def edit; end

    def update
      user.update!(user_params)
      redirect_to admin_users_path
    end

    def destroy
      user.destroy
      redirect_to admin_users_path
    end

    private

    def users_accomplishments
      Learning::Accomplishment.includes(:topic).where(user_id: users)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :github_url)
    end
  end
end
