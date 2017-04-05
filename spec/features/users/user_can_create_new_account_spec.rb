require 'rails_helper'

RSpec.feature "User creating a new account" do
  context "when providing all information" do
    scenario "they are logged in succesfully" do

      visit 'users/new'
      fill_in "user[username]", with: "carmer"
      fill_in "user[email]", with: "carmer@example.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Join Our Club"
      expect(current_path).to eq( user_path( User.last ) )

      expect(page).to have_content("Succesfully logged in!")
      expect(page).to have_content("carmer")
    end
  end
end
