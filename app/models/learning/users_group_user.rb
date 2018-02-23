module Learning
  class UsersGroupUser < ApplicationRecord
    belongs_to :users_group
    belongs_to :user
  end
end
