require 'rails_helper'
require "shoulda-matchers"

describe Group, type: :model do
  Group.create(
    name: 'Family'
  )
  it { should validate_presence_of(:name) }

end
