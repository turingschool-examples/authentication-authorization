require "rails_helper"

RSpec.feature "A User logging in" do
  context "successfully" do
    scenario "providing username and password" do
      user = User.create( username: "Carmer",
                          email: "carmer@example.com",
                          password: "password")

      visit login_path
      fill_in "Username", with: "Carmer"
      fill_in "session[password]", with: "password"

      click_on "Log In"

      expect(current_path).to eq( user_path(user) )
      expect(page).to have_content("Carmer")
      expect(page).to have_content("Log In Successful")
    end
  end
end
