require_relative '../authentication'

module Authentication
  # User can be identified by multiple auth providers (github, facebook, etc..).
  # This class represents identity of concreate provider
  class Identity < ApplicationRecord
    belongs_to :user
  end
end
