require 'rails_helper'

RSpec.describe "Timer Feature", type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  describe "User logs outdoor time" do
    it 'successfully starts and stops the timer' do
      visit root_path
      within '#start-timer-form' do
        click_button "Start Timer"
      end
      sleep 1
      within '#stop-timer-form' do
        click_button "Stop Timer"
      end

      expect(page).to have_content("Outdoor session ended successfully")
    end

    it "Allows a user to manually create an outdoor session" do
      visit root_path

      within '#manual-session-form' do
        select '2024', from: 'outdoor_session_start_time_1i'
        select 'July', from: 'outdoor_session_start_time_2i'
        select '18', from: 'outdoor_session_start_time_3i'
        select '10', from: 'outdoor_session_start_time_4i'
        select '00', from: 'outdoor_session_start_time_5i'

        select '2024', from: 'outdoor_session_end_time_1i'
        select 'July', from: 'outdoor_session_end_time_2i'
        select '18', from: 'outdoor_session_end_time_3i'
        select '11', from: 'outdoor_session_end_time_4i'
        select '00', from: 'outdoor_session_end_time_5i'

        fill_in "Description", with: "A walk on the Hominy Creek to beach"
        click_button "Create Outdoor Session"
      end

      expect(page).to have_content("Outdoor session created successfully")
      expect(page).to have_content("A walk on the Hominy Creek to beach")
    end
  end
end
