require './test/test_helper'
require './lib/timesheet'

class TimesheetTest < Minitest::Test
  def test_instantiation
    timesheet = Timesheet.new("1", "1", "2016-01-01", "480")

    assert_instance_of Timesheet, timesheet
  end

  def test_attributes
    timesheet = Timesheet.new("1", "1", "2016-01-01", "480")

    assert_equal 1, timesheet.employee_id
    assert_equal 1, timesheet.project_id
    assert_instance_of Date, timesheet.date
    assert_equal 480, timesheet.minutes
  end
end
