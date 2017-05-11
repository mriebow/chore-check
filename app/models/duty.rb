class Duty < ApplicationRecord
  belongs_to :chore
  belongs_to :group
end
