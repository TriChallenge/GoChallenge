require 'rails_helper'

RSpec.describe "Timer Feature", type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  describe "User logs outdoor time" do
    it 'successfully starts and stops the timer' do
      visit root_path
      click_button "Start Timer"
      sleep 1
      click_button "Stop Timer"

      expect(page).to have_content("Outdoor session loged successfully")
    end

    it "has a place for a user to add a description to the session" do
      visit root_path
      click_button "Start Timer"
      sleep 1
      click_button "Stop Timer"
      fill_in "Description", with: "Playing in the park"
      click_button "Save Description"

      expect(page).to have_content("Playing in the park")
    end

    it "Allows a user to manually create an outdoor session" do
      visit new_outdoor_session_path
      fill_in "Start time", with: "2024-07-18 10:00:00"
      fill_in "End time", with: "2024-07-18 11:00:00"
      fill_in "Description", with: "A walk on the Hominy Creek to beach"
      click_button "Create Outdoor Session"

      expect(page).to have_content("Outdoor session created successfully")
      expect(page).to have_content("A walk on the Hominy Creek to beach")
    end
  end
end