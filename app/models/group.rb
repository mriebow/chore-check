
class Group < ApplicationRecord
  validates :name, presence: true

  has_many :memberships
  has_many :users, through: :memberships
  has_many :chores

  # accepts_nested_attributes_for :memberships
end
