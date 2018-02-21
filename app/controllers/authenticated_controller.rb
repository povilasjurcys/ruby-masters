# Base class for all controllers which require authentication
class AuthenticatedController < ApplicationController
  class NotAuthenticatedUserError < StandardError; end

  rescue_from NotAuthenticatedUserError, with: :redirect_to_login_page

  before_action :require_user

  helper_method :current_user

  protected

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = User.find_by(id: session[:current_user_id])
  end

  private

  def require_user
    raise NotAuthenticatedUserError unless current_user.present?
  end

  def redirect_to_login_page
    redirect_to new_authentication_session_url
  end
end
