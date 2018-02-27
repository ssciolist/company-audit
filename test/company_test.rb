require './test/test_helper'
require './lib/company'
require 'pry'

class CompanyTest < Minitest::Test
  def test_instantiation
    company = Company.new

    assert_instance_of Company, company
  end

  def test_attributes
    company = Company.new

    assert_equal [], company.employees
    assert_equal [], company.projects
    assert_equal [], company.timesheets
  end

  def test_load_employees
    company = Company.new
    result = company.load_employees('./data/employees.csv')
    bad_data_result = company.load_employees('./data/bad_employees.csv')

    assert_equal company.good_hash, result
    assert_equal company.bad_hash, bad_data_result
  end

  def test_load_projects
    company = Company.new
    result = company.load_projects('./data/projects.csv')
    bad_data_result = company.load_projects('./data/bad_projects.csv')

    assert_equal company.good_hash, result
    assert_equal company.bad_hash, bad_data_result
  end

  def test_load_timesheets
    # skip
    company = Company.new
    result = company.load_timesheets('./data/timesheets.csv')
    bad_data_result = company.load_employees('./data/bad_timesheets.csv')

    assert_equal company.good_hash, result
    assert_equal company.bad_hash, bad_data_result
  end

  def test_find_employee_by_id
    company = Company.new
    company.load_employees('./data/employees.csv')
    result = company.find_employee_by_id(1)

    assert_instance_of Employee, result
    assert_equal 1, result.employee_id
  end

  def test_find_project_by_id
    company = Company.new
    company.load_projects('./data/projects.csv')
    result = company.find_project_by_id(1)

    assert_instance_of Project, result
    assert_equal 1, result.id
  end
end
