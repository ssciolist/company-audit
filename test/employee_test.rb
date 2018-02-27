require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def test_instantiation
    employee = Employee.new("1", "Susan Smith", "Manager", "2016-01-01", "2018-02-20")

    assert_instance_of Employee, employee
  end

  def test_attributes
    employee = Employee.new("1", "Susan Smith", "Manager", "2016-01-01", "2018-02-20")

    assert_equal 1, employee.employee_id
    assert_equal "Susan Smith", employee.name
    assert_equal "Manager", employee.role
    assert_instance_of Date, employee.start_date
  end
end
