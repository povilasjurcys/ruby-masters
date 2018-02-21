module Administration
  class AdministrationController < AuthenticatedController
    protected

    def require_user
      super
      raise NotAuthenticatedUserError unless current_user.is_a?(AdminUser)
    end
  end
end
