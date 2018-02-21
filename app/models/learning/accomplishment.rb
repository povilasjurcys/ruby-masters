module Learning
  class Accomplishment < ApplicationRecord
    enum status: %i[skipped done]

    belongs_to :user
    belongs_to :topic

    validates :status, presence: true
  end
end
