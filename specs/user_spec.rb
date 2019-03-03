require("minitest/autorun")
require("minitest/rg")
require_relative("../models/user")

class UserTest < MiniTest::Test

  def setup()
    @user = User.new({
      "name" => "Angelina Blyth"
      })
  end

  def test_name()
    assert_equal("Angelina Blyth", @user.name)
  end

end
