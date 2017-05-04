class Group < ApplicationRecord
  validates :name, presence: true

  has_many :members, class_name: "User"
  belongs_to :creator, class_name: "User"
end
