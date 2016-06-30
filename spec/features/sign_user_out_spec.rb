require "rails_helper"

RSpec.feature "Signing out signed-in users" do

  before do

    @john = User.create!(email: "john@example", password: "password")

    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log In"
  end

  scenario do
    visit "/"
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end
end
