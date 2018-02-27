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

  # def hash_check_employee(filepath)
  #   if
  #     CSV.foreach(filepath, headers: false) do |row|
  #       row.length == 5
  #     end
  #     {success: true, error: nil}
  #   else
  #     {success: false, error: 'bad data'}
  #   end
  # end

  def bad_hash
    {success: false, error: 'bad data'}
  end

  def good_hash
    {success: true, error: nil}
  end

  def load_employees(filepath)
    data = CSV.read(filepath)
      if data.all? { |row| row.length == 5}
        CSV.foreach(filepath, headers: false) do |row|
          @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
        end
        good_hash
      else
        bad_hash
      end
  end

  def load_projects(filepath)
    data = CSV.read(filepath)
      if data.all? { |row| row.length == 4}
        CSV.foreach(filepath, headers: false) do |row|
          @projects << Project.new(row[0], row[1], row[2], row[3])
        end
        good_hash
      else
        bad_hash
      end
  end

  def load_timesheets(filepath)
    data = CSV.read(filepath)
      if data.all? { |row| row.length == 4}
        CSV.foreach(filepath, headers: false) do |row|
          @timesheets << Timesheet.new(row[0], row[1], row[2], row[3])
        end
        good_hash
      else
        bad_hash
      end
  end
end
