module Learning
  class UsersGroup < ApplicationRecord
    has_many :users_group_users, class_name: 'UsersGroupUser'
    has_many :users, through: :users_group_users
  end
end
