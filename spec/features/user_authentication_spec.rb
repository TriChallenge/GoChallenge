require 'rails_helper'

RSpec.describe "User Authentication", type: :feature do
  let(:user) { create(:user) }

  describe "User signs up" do
    it 'successfully registers a user' do
      visit new_user_registration_path
      fill_in "Email", with: "nico_shanti@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"

      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end

  describe "User logs in" do
    it "logs a user in successfully" do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      expect(page).to have_content("Signed in successfully.")
    end
  end

  describe "user logs out" do
    it "successfully logs a user out" do
      login_as(user, scope: :user)
      visit root_path
      click_link "Logout"

      expect(page).to have_content("Signed out successfully.")
    end
  end
end