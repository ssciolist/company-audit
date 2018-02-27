require './test/test_helper'
require './lib/project'

class ProjectTest < Minitest::Test
  def test_instantiation
    project = Project.new("1", "Widgets", "2016-01-01", "2016-06-30")

    assert_instance_of Project, project
  end

  def test_attributes
    project = Project.new("1", "Widgets", "2016-01-01", "2016-06-30")

    assert_equal 1, project.id
    assert_equal "Widgets", project.name
    assert_instance_of Date, project.start_date
    assert_instance_of Date, project.end_date
  end
end
