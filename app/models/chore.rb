class Chore < ApplicationRecord
  validates :task, presence: true
  validates :deadline, presence: true

  belongs_to :user
end
