require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "name must be present" do
    user = User.new(name: "", email: "email@gmail.com")
    assert_not user.valid?
  end
  
  test "email must be present" do
    user = User.new(name: "thomas", email: "")
    assert_not user.valid?
  end
  
end
