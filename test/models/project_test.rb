require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "name required" do
    p1 = Project.new(description: "lol", repo_url: "um no", live_site: "nope")
    p2 = Project.new(description: "lol", repo_url: "um no", live_site: "nope", name: "name")
    refute p1.save
    assert p2.save
  end

  test "description required" do
    p1 = Project.new(name: "name", repo_url: "um no", live_site: "nope")
    p2 = Project.new(name: "name", repo_url: "um no", live_site: "nope", description: "lol")
    refute p1.save
    assert p2.save
  end

  test "repo_url required" do
    p1 = Project.new(name: "name", description: "lol", live_site: "nope")
    p2 = Project.new(name: "name", description: "lol", live_site: "nope", repo_url: "um no")
    refute p1.save
    assert p2.save
  end

  test "live_site required" do
    p1 = Project.new(name: "name", description: "lol", repo_url: "um no")
    p2 = Project.new(name: "name", description: "lol", repo_url: "um no", live_site: "nope")
    refute p1.save
    assert p2.save
  end

  test "has many technologies" do
    project = Project.create(name: "name", description: "lol", repo_url: "um no", live_site: "nope")
    t1, t2 = technologies(:one, :two)
    assert_difference "project.technologies.count", 2 do
      project.technologies << t1
      project.technologies << t2
    end
  end
end
