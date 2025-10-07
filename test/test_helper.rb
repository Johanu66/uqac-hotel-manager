ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # Disable this if you want to control fixtures manually
    # fixtures :all

    # Add more helper methods to be used by all tests here...

    # Helper method to clean database between tests
    def setup
      DatabaseCleaner.start if defined?(DatabaseCleaner)
    end

    def teardown
      DatabaseCleaner.clean if defined?(DatabaseCleaner)
    end
  end
end
