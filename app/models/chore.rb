class Chore < ApplicationRecord
  validates :task, presence: true
  validates :deadline, presence: true

  has_many :groups
end
