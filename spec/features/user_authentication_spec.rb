require 'rails_helper'

RSpec.describe "User Authentication", type: :feature do
  it "successfully registers a user" do
    visit new_user_registration_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  it "logs a user in successfully" do
    user = create(:user, email: "test@example.com", password: "password")
    visit new_user_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  it "logs a user out successfully" do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path
    click_link "Logout"

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
