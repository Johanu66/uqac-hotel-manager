require "test_helper"

class AdminUserTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  def setup
    # Clean up before each test
    AdminUser.delete_all
  end

  test "should create admin user with valid attributes" do
    admin_user = AdminUser.new(
      name: "Test Admin",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      role: "receptionist"
    )

    assert admin_user.valid?
    assert admin_user.save
  end

  test "should require email" do
    admin_user = AdminUser.new(
      name: "Test Admin",
      password: "password123",
      password_confirmation: "password123",
      role: "receptionist"
    )

    assert_not admin_user.valid?
    assert_includes admin_user.errors[:email], "can't be blank"
  end

  test "should require valid email format" do
    admin_user = AdminUser.new(
      name: "Test Admin",
      email: "invalid_email",
      password: "password123",
      password_confirmation: "password123",
      role: "receptionist"
    )

    assert_not admin_user.valid?
    assert_includes admin_user.errors[:email], "is invalid"
  end

  test "should require unique email" do
    AdminUser.create!(
      name: "Test Admin 1",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      role: "receptionist"
    )

    duplicate_admin = AdminUser.new(
      name: "Test Admin 2",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      role: "receptionist"
    )

    assert_not duplicate_admin.valid?
    assert_includes duplicate_admin.errors[:email], "has already been taken"
  end

  test "should require password" do
    admin_user = AdminUser.new(
      name: "Test Admin",
      email: "test@example.com",
      role: "receptionist"
    )

    assert_not admin_user.valid?
    assert_includes admin_user.errors[:password], "can't be blank"
  end

  test "should require minimum password length" do
    admin_user = AdminUser.new(
      name: "Test Admin",
      email: "test@example.com",
      password: "short",
      password_confirmation: "short",
      role: "receptionist"
    )

    assert_not admin_user.valid?
    assert_includes admin_user.errors[:password], "is too short (minimum is 6 characters)"
  end

  test "should authenticate with correct password" do
    admin_user = AdminUser.create!(
      name: "Test Admin",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      role: "receptionist"
    )

    assert admin_user.valid_password?("password123")
    assert_not admin_user.valid_password?("wrongpassword")
  end

  test "should have ransackable attributes" do
    actual_attributes = AdminUser.ransackable_attributes.sort
    # Just check that some key attributes are present
    assert_includes actual_attributes, "id"
    assert_includes actual_attributes, "email"
    assert_includes actual_attributes, "name"
    assert_includes actual_attributes, "created_at"
    assert_includes actual_attributes, "updated_at"
  end

  test "should have ransackable associations method" do
    assert_respond_to AdminUser, :ransackable_associations
    # Should return an array (could be empty)
    assert_kind_of Array, AdminUser.ransackable_associations
  end

  test "should have role enum" do
    admin_user = AdminUser.new(
      name: "Test Admin",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      role: "manager"
    )

    assert admin_user.valid?
    assert_equal "manager", admin_user.role
    assert admin_user.manager?
  end

  test "should handle role validation" do
    # Test with valid role
    admin_user = AdminUser.new(
      name: "Test Admin",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      role: "receptionist"
    )

    assert admin_user.valid?, "Should be valid with receptionist role"

    # Test role assignment and checking
    admin_user.save!
    assert_equal "receptionist", admin_user.role
    assert admin_user.receptionist?
    assert_not admin_user.manager?
  end

  test "should have display methods" do
    admin_user = AdminUser.create!(
      name: "Test Admin",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123",
      role: "receptionist"
    )

    assert_respond_to admin_user, :to_s
    assert_respond_to admin_user, :display_name
    assert_equal "Test Admin", admin_user.to_s
    assert_equal "Test Admin", admin_user.display_name
  end
end
