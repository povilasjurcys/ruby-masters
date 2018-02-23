class User < ApplicationRecord
  has_many :accomplishments, class_name: 'Learning::Accomplishment', dependent: :destroy

  def full_name
    [first_name, last_name].join(' ')
  end
end
