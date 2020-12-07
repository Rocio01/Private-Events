require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
  end

  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:attendees) }
    it { should have_many(:attendances) }
  end
end
