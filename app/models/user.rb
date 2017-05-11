require "pg_search"
class User < ApplicationRecord
  include PgSearch

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true

  pg_search_scope :search_by_username,
   against: [:username]
  scope :search, ->(query) { search_user_only(query) if query.present? }

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :groups, through: :memberships

  has_many :chores
end
