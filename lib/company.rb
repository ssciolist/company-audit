require 'csv'
require './lib/employee'

class Company
  attr_reader :employees,
              :projects,
              :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def good_hash
    {success: true, error: nil}
  end

  def bad_hash
    {success: false, error: 'bad data'}
  end

  def load_employees(filepath)
    CSV.foreach(filepath, headers: false) do |row|
      return bad_hash if !row.length == 5
      id = row[0]
      name = row[1]
      role = row[2]
      start_date = row[3]
      end_date = row[4]
      @employees << Employee.new(id, name, role, start_date, end_date)
    end
    good_hash
  end

end
