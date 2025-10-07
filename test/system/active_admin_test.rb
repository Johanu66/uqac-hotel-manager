require "application_system_test_case"

class ActiveAdminTest < ApplicationSystemTestCase
  self.use_transactional_tests = true

  def setup
    # Clean up database before each test
    AdminUser.delete_all
    User.delete_all
    TypeChambre.delete_all
    Chambre.delete_all

    # Create test admin user
    @admin_user = AdminUser.create!(
      name: "Test Admin",
      email: "admin@test.com",
      password: "password123",
      password_confirmation: "password123",
      role: "manager"
    )

    # Create test data
    @type_chambre = TypeChambre.create!(
      nom: "Suite Standard",
      description: "Standard room type",
      prix_par_nuit: 100.0,
      capacite: 2,
      nombre_total: 10
    )

    @chambre = Chambre.create!(
      numero: "201",
      statut: "available",
      description: "Nice room",
      type_chambre: @type_chambre
    )

    @user = User.create!(
      name: "Test User",
      email: "user@test.com",
      password: "password123",
      password_confirmation: "password123",
      confirmed_at: Time.current
    )
  end

  test "can access admin login and authenticate" do
    # Visit admin area - should redirect to login
    visit "/admin"
    assert_current_path "/admin/login"

    # Check login form is present
    assert_selector "h2", text: "Hotel Manager Sign In"
    assert_selector "form"

    # Login with admin credentials
    fill_in "admin_user_email", with: @admin_user.email
    fill_in "admin_user_password", with: "password123"
    find('input[type="submit"]').click

    # Should be redirected to dashboard
    assert_current_path "/admin"
    assert_selector "h2", text: "Dashboard"
  end

  test "can access users resource" do
    admin_login

    # Visit users page directly
    visit "/admin/users"
    assert_current_path "/admin/users"

    # Check page content (using actual ActiveAdmin text)
    assert_selector "h2", text: "Client"
    assert_selector "table"

    # Check for our test user in table
    assert_selector "td", text: @user.name
    assert_selector "td", text: @user.email
  end

  test "can access chambres resource" do
    admin_login

    # Visit chambres page directly
    visit "/admin/chambres"
    assert_current_path "/admin/chambres"

    # Check page content (using actual ActiveAdmin text)
    assert_selector "h2", text: "Room"
    assert_selector "table"

    # Check for our test chambre
    assert_selector "td", text: @chambre.numero
  end

  test "can access type chambres resource" do
    admin_login

    # Visit type_chambres page directly
    visit "/admin/type_chambres"
    assert_current_path "/admin/type_chambres"

    # Check page content (using actual ActiveAdmin text)
    assert_selector "h2", text: "Room Type"
    assert_selector "table"

    # Check for our test type
    assert_selector "td", text: @type_chambre.nom
  end

  test "unauthorized access redirects to login" do
    # Try to access admin pages without authentication
    visit "/admin"
    assert_current_path "/admin/login"

    visit "/admin/users"
    assert_current_path "/admin/login"

    visit "/admin/chambres"
    assert_current_path "/admin/login"
  end

  test "wrong credentials show error" do
    visit "/admin"
    assert_current_path "/admin/login"

    # Try wrong password
    fill_in "admin_user_email", with: @admin_user.email
    fill_in "admin_user_password", with: "wrongpassword"
    find('input[type="submit"]').click

    # Should stay on login page
    assert_current_path "/admin/login"

    # Check that we're still on login (indicates error)
    assert_selector "h2", text: "Hotel Manager Sign In"
  end

  private

  def admin_login
    visit "/admin"
    assert_current_path "/admin/login"

    fill_in "admin_user_email", with: @admin_user.email
    fill_in "admin_user_password", with: "password123"
    find('input[type="submit"]').click

    assert_current_path "/admin"
  end
end
