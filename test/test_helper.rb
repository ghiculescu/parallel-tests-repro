ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, threshold: 2)

  # Don't use fixtures.
  # fixtures :all

  10.times {|n| User.create!(name: "User #{n}") }
end
