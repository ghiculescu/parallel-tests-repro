require "test_helper"

class UserTest < ActiveSupport::TestCase
  ENV.fetch("TESTS", 1).to_i.times do |n|
    test "static data is created in test_helper.rb - #{n}" do
      assert_equal 10, User.count
    end
  end
end
