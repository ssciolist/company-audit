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

  def load_employees(filepath)
    CSV.foreach(filepath, headers: false) do |row|
      id = row[0]
      name = row[1]
      role = row[2]
      start_date = row[3]
      end_date = row[4]
      @employees << Employee.new(id, name, role, start_date, end_date)
    end
  end

end
