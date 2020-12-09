require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
  describe 'associations' do
    it { should have_many(:events) }
    it { should have_many(:attendances) }
    it { should have_many(:attended_events) }
  end
end
