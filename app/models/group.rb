
class Group < ApplicationRecord
  validates :name, presence: true

  has_many :memberships
  has_many :users, through: :memberships

  # accepts_nested_attributes_for :memberships
end
