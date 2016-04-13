require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "logged in admin can view categories index" do
    admin = User.create(
      username: "msadmin",
      password: "password",
      role: 1
    )
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path

    assert page.has_content?("Admin Categories")
  end

  test "default logged in user cannot view categories index" do
    user = User.create(
      username: "defaultperson",
      password: "password",
      role: 0
    )
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_categories_path

    save_and_open_page
    refute page.has_content?("Admin Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
