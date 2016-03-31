require 'test_helper'

class TechnologyTest < ActiveSupport::TestCase
  test "name required" do
    t1 = Technology.new(link: "link")
    t2 = Technology.new(link: "link", name: "name")
    refute t1.save
    assert t2.save
  end

  test "link required" do
    t1 = Technology.new(name: "name")
    t2 = Technology.new(name: "name", link: "link")
    refute t1.save
    assert t2.save
  end
end
