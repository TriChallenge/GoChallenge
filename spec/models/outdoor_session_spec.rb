require 'rails_helper'

RSpec.describe OutdoorSession, type: :model do
  it "has a valid factory" do
    expect(build(:outdoor_session)).to be_valid
  end

  it { should belong_to(:user) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time).on(:update) }

  describe "validations" do
    let(:user) { create(:user) }

    it "is valid with valid attributes" do
      session = user.outdoor_sessions.build(
        start_time: 1.hour.ago,
        end_time: Time.current,
        description: "Test session"
      )
      session.save
      expect(session).to be_valid
      expect(session.duration).to eq(((session.end_time - session.start_time) / 1.hour).round(2))
    end

    it "is invalid without a user" do
      session = OutdoorSession.new(
        start_time: 1.hour.ago,
        end_time: Time.current,
        description: "Test session"
      )
      expect(session).to_not be_valid
      expect(session.errors[:user]).to include("must exist")
    end

    it "is invalid with end_time before start_time" do
      session = user.outdoor_sessions.build(
        start_time: Time.current,
        end_time: 1.hour.ago,
        description: "Test session"
      )
      expect(session).to_not be_valid
      expect(session.errors[:end_time]).to include("must be after the start time")
    end
  end
end
