module Admin
  class AdministrationController < AuthenticatedController
    expose(:users) { users_group ? users_group.users : User.all }
    expose(:users_group) { Learning::UsersGroup.find_by(id: params[:users_group_id]) }
    expose(:user_groups) { Learning::UsersGroup.all }

    protected

    def require_user
      super
      raise NotAuthenticatedUserError unless current_user.is_a?(AdminUser)
    end
  end
end
