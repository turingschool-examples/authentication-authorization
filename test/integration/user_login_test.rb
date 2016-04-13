require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "existing user can login" do
    login_user
    
    assert page.has_content?("Welcome, Clarence!")
    assert page.has_content?("Logout")
  end

  test "guest cannot login" do
    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid. Try Again.")
    assert page.has_content?("Login")
  end

  test "registered user cannot login with wrong password" do
    user = User.create(username: "Clarence", 
                       password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "notmypassword"
    click_button "Login"

    assert page.has_content?("Invalid. Try Again.")
    assert page.has_content?("Login")
  end

  test "authenticated user can logout" do
    login_user

    assert page.has_content?("Welcome, Clarence!")

    click_link "Logout"

    assert page.has_content?("Goodbye!")
    assert page.has_content?("Login")
  end

  def login_user
    User.create(username: "Clarence", 
                       password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"
  end
end
