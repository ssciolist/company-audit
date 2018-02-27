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
    CSV.foreach(filepath, headers: false) do |row|
      if row.any? { |element| element.nil?}
        bad_hash
      else
      @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
      good_hash
      end
    end
  end
end
