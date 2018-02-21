module Authentication
  class SessionsController < ApplicationController
    def new
      redirect_to '/auth/github'
    end

    def create
      identity = FindOrCreateIdentity.new(auth_hash).call
      session[:current_user_id] = identity.user.id

      redirect_back(fallback_location: root_url)
    end

    private

    def user_by_auth_hash
    end

    def auth_hash
      request.env['omniauth.auth'].to_h.deep_symbolize_keys
    end
  end
end
