class Audit
  attr_reader :company
  def initialize
  end

  def load_company(company)
    @company = company
  end

  def were_invalid_employees_working
    invalid_timesheet = @company.timesheets.find_all do |timesheet|
      !@company.find_employee_by_id(timesheet.employee_id)
    end

    if invalid_timesheet.empty?
      false
    else
      invalid_timesheet[0].employee_id
    end
  end

  def were_invalid_projects_being_worked_on
    invalid_project = @company.timesheets.find_all do |timesheet|
      !@company.find_project_by_id(timesheet.project_id)
    end

    if invalid_project.empty?
      false
    else
      invalid_project.flatten.project_id
    end
  end

end
