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
    bad_data_result = company.load_employees('./data/employees.csv')
binding.pry
    # assert_equal {success: true, error: nil}, result
    # assert_equal {success: false, error: 'bad data'}, bad_data_result
  end
end
