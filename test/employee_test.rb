require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def test_instantiation
    employee = Employee.new("1", "Susan Smith", "Manager", "2016-01-01", "2018-02-20")

    assert_instance_of Employee, employee
  end

  def test_attributes
  end
end
