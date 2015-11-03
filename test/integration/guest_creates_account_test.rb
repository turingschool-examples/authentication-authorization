require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test 'user can create account' do 
    visit new_user_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Clarence!")
  end
end