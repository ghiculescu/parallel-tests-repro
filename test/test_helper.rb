ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, threshold: 2)

  # Don't use fixtures.
  # fixtures :all

  def self.load_data_into_test_db
    10.times {|n| User.create!(name: "User #{n}") }
  end

  parallelize_setup do
    load_data_into_test_db
  end

  load_data_into_test_db
end
