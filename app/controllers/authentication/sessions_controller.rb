module Authentication
  class SessionsController < ApplicationController
    def new
      redirect_to '/auth/github'
    end

    def create
      identity = FindOrCreateIdentity.new(auth_hash).call
      session[:current_user_id] = identity.user.id

      redirect_to root_url
    end

    def destroy
      session.delete(:current_user_id)
      @current_user = nil
      redirect_to root_url
    end

    private

    def auth_hash
      request.env['omniauth.auth'].to_h.deep_symbolize_keys
    end
  end
end
