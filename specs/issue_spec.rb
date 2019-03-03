require("minitest/autorun")
require("minitest/rg")
require_relative("../models/user")
require_relative("../models/issue")

class IssueTest < MiniTest::Test

  def setup()
    @user = User.new({
      "name" => "Angelina Blyth"
      })
    @issue = Issue.new({
      "user_id" => @user.id,
      "date" => "02/01/2019",
      "time" => "12:00",
      "incidentType" => "Networking",
      "description" => "Unable to connect to the network"
      })
  end

    def test_date()
      assert_equal("02/01/2019", @issue.date)
    end

    def test_time()
      assert_equal("12:00", @issue.time)
    end

    def test_incident_type()
      assert_equal("Networking", @issue.incidentType)
    end

    def test_description()
      assert_equal("Unable to connect to the network", @issue.description)
    end
end
