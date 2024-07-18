require 'rails_helper'

RSpec.describe OutdoorSession, type: :model do
  it "has a valid factory" do
    expect(build(:outdoor_session)).to be_valid
  end

  it { should belong_to(:user) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:duration) }
end
