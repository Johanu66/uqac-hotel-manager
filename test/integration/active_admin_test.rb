require "test_helper"

class ActiveAdminTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = true

  def setup
    # Clean up database
    AdminUser.delete_all
    User.delete_all

    @admin_user = AdminUser.create!(
      name: "Admin Test",
      email: "admin@test.com",
      password: "password123",
      password_confirmation: "password123",
      role: "manager"
    )
  end

  test "admin login page is accessible" do
    get "/admin/login"
    assert_response :success
    assert_select "form"
  end

  test "admin dashboard redirects when not logged in" do
    get "/admin"
    assert_redirected_to "/admin/login"
  end

  test "admin users index redirects when not logged in" do
    get "/admin/users"
    assert_redirected_to "/admin/login"
  end

  test "admin admin_users index redirects when not logged in" do
    get "/admin/admin_users"
    assert_redirected_to "/admin/login"
  end

  test "admin chambres index redirects when not logged in" do
    get "/admin/chambres"
    assert_redirected_to "/admin/login"
  end

  test "admin type_chambres index redirects when not logged in" do
    get "/admin/type_chambres"
    assert_redirected_to "/admin/login"
  end

  test "admin reservations index redirects when not logged in" do
    get "/admin/reservations"
    assert_redirected_to "/admin/login"
  end

  test "ActiveAdmin resources are properly registered" do
    # Check that ActiveAdmin application exists
    assert_not_nil ActiveAdmin.application

    # Check that admin namespace exists
    admin_namespace = ActiveAdmin.application.namespaces[:admin]
    assert_not_nil admin_namespace

    # Check that our resources are registered
    registered_resources = admin_namespace.resources.keys.map(&:to_s)
    expected_resources = [ "AdminUser", "User", "Chambre", "TypeChambre", "Reservation" ]

    expected_resources.each do |resource|
      assert_includes registered_resources, resource, "#{resource} should be registered in ActiveAdmin"
    end
  end

  test "ActiveAdmin configuration is correct" do
    app = ActiveAdmin.application

    # Check authentication method
    assert_equal :authenticate_admin_user!, app.authentication_method

    # Check current user method
    assert_equal :current_admin_user, app.current_user_method

    # Check logout link path
    assert_equal :destroy_admin_user_session_path, app.logout_link_path
  end
end
