require 'rails_helper'
require "shoulda-matchers"

describe Group, type: :model do
  Group.create(
    name: 'Family',
    creator_id: '1'
  )
  it { should validate_presence_of(:name) }

end
