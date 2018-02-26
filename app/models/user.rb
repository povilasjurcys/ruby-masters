class User < ApplicationRecord
  has_many :accomplishments, class_name: 'Learning::Accomplishment', dependent: :destroy
  has_many :users_group_users, dependent: :destroy, class_name: 'Learning::UsersGroupUser'
  has_many :user_groups, through: :users_group_users, source: :users_group, class_name: 'Learning::UsersGroup'

  def full_name
    [first_name, last_name].join(' ')
  end
end
